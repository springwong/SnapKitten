//
//  CubItem.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import UIKit

internal final class CubItem {
    var view : UIView
    
    var isCenter : Bool = false
    var isCenterX : Bool = false
    var isCenterY : Bool = false
    
    var topOffset : Int = 0
    var leftOffset : Int = 0
    var bottomOffset : Int = 0
    var rightOffset : Int = 0

    var topAction : CubRelativeAction?
    var bottomAction : CubRelativeAction?
    var leftAction : CubRelativeAction?
    var rightAction : CubRelativeAction?
    
    init(view : UIView) {
        self.view = view
    }
}
