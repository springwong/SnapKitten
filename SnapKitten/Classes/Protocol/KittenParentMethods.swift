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
    func defaultAlignment(_ alignment : KittenAlignment) -> KittenParentMethods
    func startPadding(_ value : Int) -> KittenParentMethods
    func endPadding(_ value : Int) -> KittenParentMethods
    func itemDefaultOffset(_ value : Int)->KittenParentMethods
    func itemDefaultSideStartPadding(_ value : Int)->KittenParentMethods
    func itemDefaultSideEndPadding(_ value : Int)->KittenParentMethods
    func allPadding(_ value : Int)->KittenParentMethods
    //is items match_parent
    func isAlignDirectionEnd(_ isAlign : Bool) -> KittenParentMethods
    //the layout direct
//    func orientation(_ orientation : KittenOrientation) -> KittenParentMethods
    //swift only methods for ViewController
    func parentTop(_ top : ConstraintItem) -> KittenParentMethods
    func parentLeft(_ left : ConstraintItem) -> KittenParentMethods
    func parentBottom(_ bottom : ConstraintItem) -> KittenParentMethods
    func parentRight(_ right : ConstraintItem) -> KittenParentMethods
    func weightMode(_ isOn : Bool) -> KittenParentMethods
}
