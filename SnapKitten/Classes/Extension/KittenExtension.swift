//
//  SnapKittenExtension.swift
//  SnapKitten
//
//  Created by Spring Wong on 25/2/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import UIKit

public extension UIScrollView{
    func attachContentView(contentView : UIView, scrollOrientation : KittenOrientation){
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            if let parent = self.superview{
                switch scrollOrientation{
                case .vertical:
                    make.width.equalTo(parent)
                    make.left.right.equalToSuperview()
                    make.top.bottom.equalToSuperview()
                case .horizontal:
                    make.height.equalTo(parent)
                    make.left.right.equalToSuperview()
                    make.top.bottom.equalToSuperview()
                }
            }else{
                switch scrollOrientation{
                case .vertical:
                    make.width.lessThanOrEqualToSuperview()
                    //                make.width.equalToSuperview()
                    make.left.right.equalToSuperview()
                    make.top.bottom.equalToSuperview()
                case .horizontal:
                    make.height.lessThanOrEqualToSuperview()
                    //                make.height.equalToSuperview()
                    make.top.bottom.equalToSuperview()
                    make.left.right.equalToSuperview()
                }
            }
            
        }
    }
}
