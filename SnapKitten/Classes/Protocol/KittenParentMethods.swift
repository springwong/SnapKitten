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
    //perpendicular alignment of items
    @discardableResult func defaultAlignment(_ alignment : KittenAlignment) -> KittenParentMethods
    @discardableResult func startPadding(_ value : Int) -> KittenParentMethods
    @discardableResult func endPadding(_ value : Int) -> KittenParentMethods
    @discardableResult func itemDefaultOffset(_ value : Int)->KittenParentMethods
    @discardableResult func itemDefaultSideStartPadding(_ value : Int)->KittenParentMethods
    @discardableResult func itemDefaultSideEndPadding(_ value : Int)->KittenParentMethods
    @discardableResult func itemDefaultSidePadding(_ value : Int) -> KittenParentMethods
    @discardableResult func allPadding(_ value : Int)->KittenParentMethods
    //is items match_parent
    @discardableResult func isAlignDirectionEnd(_ isAlign : Bool) -> KittenParentMethods
    //the layout direct
//    func orientation(_ orientation : KittenOrientation) -> KittenParentMethods
    //swift only methods for ViewController
    @discardableResult func parentTop(_ top : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentLeft(_ left : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentBottom(_ bottom : ConstraintItem) -> KittenParentMethods
    @discardableResult func parentRight(_ right : ConstraintItem) -> KittenParentMethods
    @discardableResult func weightMode(_ isOn : Bool) -> KittenParentMethods
}
