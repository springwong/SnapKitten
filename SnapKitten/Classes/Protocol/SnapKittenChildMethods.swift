//
//  SnapKittenChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol SnapKittenChildMethods : SnapKittenChild, SnapKittenBuild{
    func itemOffset(_ value : Int) -> SnapKittenChildMethods
    func sideStartPadding(_ value : Int) -> SnapKittenChildMethods
    func sideEndPadding(_ value : Int) -> SnapKittenChildMethods
    //a ratio under current orientation
    //todo : have to separate later
    func ratio(_ ratio : Float) -> SnapKittenChildMethods
    //set width of item, equalTo
    func width(_ value : Int?, _ condition : KittenSign) -> SnapKittenChildMethods
    //set height of item, equalTo
    func height(_ value : Int?, _ condition : KittenSign) -> SnapKittenChildMethods
    //set width, height
    func size(_ value : Int?, _ condition : KittenSign) -> SnapKittenChildMethods
    //set perpendicular alignment
    func align(_ alignment : KittenAlignment) -> SnapKittenChildMethods
    //check if item is added to kitten
    func condition(_ condition : @escaping KittenInsertCondition) -> SnapKittenChildMethods
    //add a fill parent space, which always compress itself if no enough space in other items
    func fillParent() -> SnapKittenChildMethods
    func priority(_ priority : KittenPriority) -> SnapKittenChildMethods
    func weight(_ value : Float) -> SnapKittenChildMethods
}
