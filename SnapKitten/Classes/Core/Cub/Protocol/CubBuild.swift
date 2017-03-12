//
//  CubBuild.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubBuild {
    //setup the snapkit constraint
    @discardableResult func build() -> UIView
    //remove added subviews before setup the snapkit
    @discardableResult func rebuild() -> UIView
}
