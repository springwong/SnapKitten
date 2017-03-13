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
    //create a empty UIView()
    @discardableResult func from() -> KittenParentMethods
    //default align topLayoutGuide and bottomLayoutGuide
    @discardableResult func from(_ parent : UIViewController) -> KittenParentMethods
    //attach a view to UIScrollView
    @discardableResult func from(_ parent : UIScrollView) -> KittenParentMethods
}
