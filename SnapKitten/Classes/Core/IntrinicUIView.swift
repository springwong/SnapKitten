//
//  IntrinicUIView.swift
//  Pods
//
//  Created by Spring Wong on 21/3/2017.
//
//

import UIKit

public class IntrinicUIView: UIView {

    override public var intrinsicContentSize: CGSize {
        var maxWidth :CGFloat = 0
        var maxHeight :CGFloat = 0
        for subview in self.subviews {
            let width : CGFloat = subview.intrinsicContentSize.width + self.frame.size.width - subview.frame.size.width
            if width > maxWidth {
                maxWidth = width
            }
            let height : CGFloat = subview.intrinsicContentSize.height + self.frame.size.height - subview.frame.size.height
            if height > maxHeight {
                maxHeight = height
            }
        }
        return CGSize(width: maxWidth, height: maxHeight)

//        return CGSize(width: 100, height: 100)
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}
