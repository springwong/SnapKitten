//
//  KittenParent.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenParent : KittenBuild{
    //prepare the parent which will added our item to
    @discardableResult func from(_ parent : UIView) -> KittenParentMethods
    @discardableResult func from() -> KittenParentMethods
    @discardableResult func from(_ parent : UIViewController) -> KittenParentMethods
    @discardableResult func from(_ parent : UIScrollView) -> KittenParentMethods
}
