//
//  KittenBuild.swift
//  Pods
//
//  Created by Spring Wong on 27/2/2017.
//
//

import Foundation

public protocol KittenBuild {
    //setup the snapkit constraint
    @discardableResult func build() -> UIView
    //remove added subviews before setup the snapkit
    @discardableResult func rebuild() -> UIView
}
