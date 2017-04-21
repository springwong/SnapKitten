//
//  KittenChild.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenChild : KittenBuild{
    //add a item to kitten, limit a user to use those methods
    @discardableResult func add(_ child : UIView) -> KittenChildMethods
    //change current updating item to child parameter, if child not exist, return a debug message
    @discardableResult func with(_ child : UIView) -> KittenChildMethods
    //add a list of child to Kitten, current object point to last object of the list
    @discardableResult func addChilds(_ childs : UIView ...) -> KittenChildMethods
    @discardableResult func addChilds(_ childs : [UIView]) -> KittenChildMethods
    @discardableResult func removeChild(_ child : UIView) -> KittenChild
    @discardableResult func removeAllChild() -> KittenChild
}
