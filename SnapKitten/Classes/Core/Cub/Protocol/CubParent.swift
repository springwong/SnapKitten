//
//  CubParent.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubParent : CubBuild {
    @discardableResult func from(_ parent : UIView) -> CubParentMethods
    @discardableResult func from() -> CubParentMethods
    @discardableResult func from(_ parent : UIViewController) -> CubParentMethods
//    @discardableResult func from(_ parent : UIScrollView) -> CubParentMethods
}
