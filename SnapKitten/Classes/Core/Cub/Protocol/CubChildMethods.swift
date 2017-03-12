//
//  CubChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubChildMethods : CubChild, CubBuild {
    @discardableResult func alignParentTop(_ offset : Int) -> CubChildMethods
    @discardableResult func alignParentBottom(_ offset : Int) -> CubChildMethods
    @discardableResult func alignParentLeft(_ offset : Int) -> CubChildMethods
    @discardableResult func alignParentRight(_ offset : Int) -> CubChildMethods
    @discardableResult func alignLeft(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func alignTop(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func alignRight(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func alignBottom(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func above(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func below(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func leftOf(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func rightOf(_ target : UIView, _ offset : Int) -> CubChildMethods
    @discardableResult func center(_ isCenter : Bool) -> CubChildMethods
    @discardableResult func centerX(_ isCenter : Bool) -> CubChildMethods
    @discardableResult func centerY(_ isCenter : Bool) -> CubChildMethods
//    func cancelItemTopSetting() -> CubChildMethods
//    func cancelItemLeftSetting() -> CubChildMethods
    
}
