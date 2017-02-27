//
//  SnapKittenParent.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol SnapKittenParent : SnapKittenBuild{
    //prepare the parent which will added our item to
    func from(_ parent : UIView) -> SnapKittenParentMethods
    func from() -> SnapKittenParentMethods
    
}
