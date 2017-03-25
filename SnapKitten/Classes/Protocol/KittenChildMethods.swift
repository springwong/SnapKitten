//
//  KittenChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenChildMethods : KittenChild, KittenBuild{
    //item offset of previous item, first item of list will not use this parameter
    @discardableResult func itemOffset(_ value : Int) -> KittenChildMethods
    //left / top padding
    @discardableResult func sideStartPadding(_ value : Int) -> KittenChildMethods
    //right / bottom padding
    @discardableResult func sideEndPadding(_ value : Int) -> KittenChildMethods
    //padding on both side
    @discardableResult func sidePadding(_ value : Int) -> KittenChildMethods
    //width of child, .equal, .min, .max
    @discardableResult func width(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //height of child, .equal, .min, .max
    @discardableResult func height(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set width, height at the same time
    @discardableResult func size(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    @discardableResult func width(_ value : Int?) -> KittenChildMethods
    @discardableResult func height(_ value : Int?) -> KittenChildMethods
    @discardableResult func size(_ value : Int?) -> KittenChildMethods
    //set perpendicular alignment, .parent, .start, .center, .end . start is top/left , end is bottom/right
    @discardableResult func align(_ alignment : KittenAlignment) -> KittenChildMethods
    @discardableResult func alignSideStart() -> KittenChildMethods
    @discardableResult func alignSideCenter() -> KittenChildMethods
    @discardableResult func alignSideEnd() -> KittenChildMethods
    @discardableResult func alignSideParent() -> KittenChildMethods
    //check if item is added to kitten, if false, child will be ignored in the build()
    @discardableResult func condition(_ condition : @escaping KittenInsertCondition) -> KittenChildMethods
    //add a fill parent space, which always compress itself if no enough space in other items
    @discardableResult func fillParent() -> KittenChildMethods
    //reverse of fillParent(), which will not fit the container
    @discardableResult func fitSize() -> KittenChildMethods
    //the importanence of child, default .high, child with .medium / .low with higher prioity to be compressed by other child
    @discardableResult func priority(_ priority : KittenPriority) -> KittenChildMethods
    @discardableResult func importanceHigh() -> KittenChildMethods
    @discardableResult func importanceMedium() -> KittenChildMethods
    @discardableResult func importanceLow() -> KittenChildMethods
    //used only in weight mode, child separate screen with it's weight, all childs weight 0 is not allowed in ios side
    @discardableResult func weight(_ value : Float) -> KittenChildMethods
}
