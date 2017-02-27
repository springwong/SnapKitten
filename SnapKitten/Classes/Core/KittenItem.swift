//
//  SnapKittenItem.swift
//  SnapKitten
//
//  Created by Spring Wong on 25/2/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import UIKit

internal final class KittenItem {
    var view : UIView
    
    var itemOffset : Int = 0
    var sideStartPadding : Int = 0
    var sideEndPadding : Int = 0
    
    var priority : KittenPriority = .medium
    var weight : Float = 1
    
    var ratio : Float?
    var width : KittenDimension?
    var height : KittenDimension?
    var isFillParent : Bool = false
    var alignment : KittenAlignment
    var insertCondition : KittenInsertCondition?

    init(child : UIView, alignment : KittenAlignment){
        self.view = child
        self.alignment = alignment
    }
}
