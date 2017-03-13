//
//  KittenParentMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation
import SnapKit

public protocol KittenParentMethods : KittenChild, KittenBuild{
    //perpendicular alignment of items, default match parent
    @discardableResult func defaultAlignment(_ alignment : KittenAlignment) -> KittenParentMethods
    //padding to the container start
    @discardableResult func startPadding(_ value : Int) -> KittenParentMethods
    //padding to the container end
    @discardableResult func endPadding(_ value : Int) -> KittenParentMethods
    //default offset between item
    @discardableResult func itemDefaultOffset(_ value : Int)->KittenParentMethods
    //default offset of start padding, it's left or top depent on diretion
    @discardableResult func itemDefaultSideStartPadding(_ value : Int)->KittenParentMethods
    //default offset of end padding , right or bottom
    @discardableResult func itemDefaultSideEndPadding(_ value : Int)->KittenParentMethods
    //default side padding of both side
    @discardableResult func itemDefaultSidePadding(_ value : Int) -> KittenParentMethods
    //4 direction also set this default padding
    @discardableResult func allPadding(_ value : Int)->KittenParentMethods
    //true make the childs' container try to match its parent width(horizontal)/height(vertical)
    @discardableResult func isAlignDirectionEnd(_ isAlign : Bool) -> KittenParentMethods
    //swift only method, show that where the top/left/bottom/right of container
    @discardableResult func parentTop(_ top : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentLeft(_ left : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentBottom(_ bottom : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentRight(_ right : ConstraintItem) -> KittenParentMethods
    //true will turn weight mode on, usually use with isAlignDirectionEnd, child's length based on their weight
    @discardableResult func weightMode(_ isOn : Bool) -> KittenParentMethods
}
