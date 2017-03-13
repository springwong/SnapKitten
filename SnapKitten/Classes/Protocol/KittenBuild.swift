//
//  KittenBuild.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenBuild {
    //setup the snapkit constraint, return childs' container (this container may not be equal to from(view)
    @discardableResult func build() -> UIView
    //remove added subviews before setup the snapkit
    @discardableResult func rebuild() -> UIView
}
