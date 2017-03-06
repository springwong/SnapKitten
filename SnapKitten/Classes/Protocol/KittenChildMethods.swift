//
//  KittenChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenChildMethods : KittenChild, KittenBuild{
    @discardableResult func itemOffset(_ value : Int) -> KittenChildMethods
    @discardableResult func sideStartPadding(_ value : Int) -> KittenChildMethods
    @discardableResult func sideEndPadding(_ value : Int) -> KittenChildMethods
    //a ratio under current orientation
    //todo : have to separate later
//    func ratio(_ ratio : Float) -> KittenChildMethods
    //set width of item, equalTo
    @discardableResult func width(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set height of item, equalTo
    @discardableResult func height(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set width, height
    @discardableResult func size(_ value : Int?, _ condition : KittenSign) -> KittenChildMethods
    //set perpendicular alignment
    @discardableResult func align(_ alignment : KittenAlignment) -> KittenChildMethods
    //check if item is added to kitten
    @discardableResult func condition(_ condition : @escaping KittenInsertCondition) -> KittenChildMethods
    //add a fill parent space, which always compress itself if no enough space in other items
    @discardableResult func fillParent() -> KittenChildMethods
    @discardableResult func priority(_ priority : KittenPriority) -> KittenChildMethods
    @discardableResult func weight(_ value : Float) -> KittenChildMethods
}
