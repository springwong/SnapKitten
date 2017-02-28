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
    func from(_ parent : UIView) -> KittenParentMethods
    func from() -> KittenParentMethods
    func from(_ parent : UIViewController) -> KittenParentMethods
}
