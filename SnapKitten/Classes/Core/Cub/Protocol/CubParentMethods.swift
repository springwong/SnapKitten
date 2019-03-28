//
//  CubParentMethods.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubParentMethods : CubChild{
    @discardableResult func defaultOffset(_ value : Int) -> CubParentMethods
    
}
