//
//  SnapKittenParentMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation
import SnapKit

public protocol SnapKittenParentMethods : SnapKittenChild, SnapKittenBuild{
    //perpendicular alignment of items
    func defaultAlignment(_ alignment : KittenAlignment) -> SnapKittenParentMethods
    func startPadding(_ value : Int) -> SnapKittenParentMethods
    func endPadding(_ value : Int) -> SnapKittenParentMethods
    func itemDefaultOffset(_ value : Int)->SnapKittenParentMethods
    func itemDefaultSideStartPadding(_ value : Int)->SnapKittenParentMethods
    func itemDefaultSideEndPadding(_ value : Int)->SnapKittenParentMethods
    //is items match_parent
    func isAlignDirectionEnd(_ isAlign : Bool) -> SnapKittenParentMethods
    //the layout direct
    func orientation(_ orientation : KittenOrientation) -> SnapKittenParentMethods
    //swift only methods for ViewController
    func parentTop(_ top : ConstraintItem) -> SnapKittenParentMethods
    func parentLeft(_ left : ConstraintItem) -> SnapKittenParentMethods
    func parentBottom(_ bottom : ConstraintItem) -> SnapKittenParentMethods
    func parentRight(_ right : ConstraintItem) -> SnapKittenParentMethods
    func weightMode(_ isOn : Bool) -> SnapKittenParentMethods
}
