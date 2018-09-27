//
//  IntrinicUIView.swift
//  Pods
//
//  Created by Spring Wong on 21/3/2017.
//
//

import UIKit

open class IntrinsicUIView: UIView {

    override open var intrinsicContentSize: CGSize {
        var maxWidth :CGFloat = self.frame.size.width
        var maxHeight :CGFloat = self.frame.size.height
        
        for subview in self.subviews {
            //get the original value of contentSize
            var contentHeight = subview.intrinsicContentSize.height
            var contentWidth = subview.intrinsicContentSize.width
            
//            print("contentHeight \(contentHeight)")
//            print("contentWidth \(contentWidth)")
            //loop subview constraint
            for constraint : NSLayoutConstraint in subview.constraints {
                //                    print(constraint.firstAttribute.rawValue)
                //                    print(constraint.constant)
                //                    print(constraint.relation.rawValue)
                //  note: constraint.relation.rawValue <= 0 means is equalTo or lessThanOrEqualTo
                //equalTo = 0
                //lessThan = -1
                //greater = 1
                if(constraint.firstAttribute == NSLayoutConstraint.Attribute.width){
                    if(
                        //check if its lessThan or equalTo, and check the constant value is less than current value
                        (constraint.relation.rawValue <= 0
                        && constraint.constant < contentWidth)
//                        ||
//                            //check if its greater than, and its value is greater than value, no checking this one now, think twice
//                        (constraint.relation.rawValue == 1
//                            && constraint.constant > contentWidth)
                        ){
                        contentWidth = constraint.constant
                    }
                    
                }
                if(constraint.firstAttribute == NSLayoutConstraint.Attribute.height){
                    if((constraint.relation.rawValue <= 0
                        && constraint.constant < contentHeight)
//                        ||
//                        (constraint.relation.rawValue == 1
//                            && constraint.constant > contentHeight)
                        ){
                        contentHeight = constraint.constant
                    }
                }
            }
            
            let width : CGFloat = contentWidth + self.frame.size.width - subview.frame.size.width
            if width > maxWidth {
                maxWidth = width
            }
            let height : CGFloat = contentHeight + self.frame.size.height - subview.frame.size.height
            if height > maxHeight {
                maxHeight = height
            }
            
        }
//        print("CGSize(width: maxWidth, height: maxHeight) \( CGSize(width: maxWidth, height: maxHeight))")
        if(superview != nil){
            superview?.invalidateIntrinsicContentSize()
        }
        return CGSize(width: maxWidth, height: maxHeight)
    }
    override open func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}
