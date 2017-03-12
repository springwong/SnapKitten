//
//  CubChild.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubChild : CubBuild{
    //add a item to kitten, limit a user to use those methods
    @discardableResult func add(_ child : UIView) -> CubChildMethods
    //change current updating item to child parameter, if child not exist, return a debug message
    @discardableResult func with(_ child : UIView) -> CubChildMethods
}
