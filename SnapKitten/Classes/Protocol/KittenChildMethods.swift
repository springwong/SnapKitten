//
//  KittenChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenChildMethods : KittenChild, KittenBuild{
    func itemOffset(_ value : Int) -> KittenChildMethods
    func sideStartPadding(_ value : Int) -> KittenChildMethods
    func sideEndPadding(_ value : Int) -> KittenChildMethods
    //a ratio under current orientation
    //todo : have to separate later
    func ratio(_ ratio : Float) -> KittenChildMethods
    //set width of item, equalTo
    func width(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set height of item, equalTo
    func height(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set width, height
    func size(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set perpendicular alignment
    func align(_ alignment : KittenAlignment) -> KittenChildMethods
    //check if item is added to kitten
    func condition(_ condition : @escaping KittenInsertCondition) -> KittenChildMethods
    //add a fill parent space, which always compress itself if no enough space in other items
    func fillParent() -> KittenChildMethods
    func priority(_ priority : KittenPriority) -> KittenChildMethods
    func weight(_ value : Float) -> KittenChildMethods
}
