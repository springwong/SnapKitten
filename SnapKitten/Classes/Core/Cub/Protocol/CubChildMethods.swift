//
//  CubChildMethods.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation

public protocol CubChildMethods : CubChild {
    @discardableResult func alignParentTop() -> CubChildMethods
    @discardableResult func alignParentBottom() -> CubChildMethods
    @discardableResult func alignParentLeft() -> CubChildMethods
    @discardableResult func alignParentRight() -> CubChildMethods
    
    @discardableResult func alignLeft(_ target : UIView) -> CubChildMethods
    @discardableResult func alignTop(_ target : UIView) -> CubChildMethods
    @discardableResult func alignRight(_ target : UIView) -> CubChildMethods
    @discardableResult func alignBottom(_ target : UIView) -> CubChildMethods
    
    @discardableResult func above(_ target : UIView) -> CubChildMethods
    @discardableResult func below(_ target : UIView) -> CubChildMethods
    @discardableResult func leftOf(_ target : UIView) -> CubChildMethods
    @discardableResult func rightOf(_ target : UIView) -> CubChildMethods
    
    @discardableResult func center(_ isCenter : Bool) -> CubChildMethods
    @discardableResult func centerX(_ isCenter : Bool) -> CubChildMethods
    @discardableResult func centerY(_ isCenter : Bool) -> CubChildMethods
    
    @discardableResult func offset(_ value : Int) -> CubChildMethods
    @discardableResult func bottomOffset(_ value : Int) -> CubChildMethods
    @discardableResult func topOffset(_ value : Int) -> CubChildMethods
    @discardableResult func leftOffset(_ value : Int) -> CubChildMethods
    @discardableResult func rightOffset(_ value : Int) -> CubChildMethods
    
    @discardableResult func width(_ value : Int?, _ condition : KittenSign) -> CubChildMethods
    @discardableResult func height(_ value : Int?, _ condition : KittenSign) -> CubChildMethods
    @discardableResult func size(_ value : Int?, _ condition : KittenSign) -> CubChildMethods

//    func cancelItemTopSetting() -> CubChildMethods
//    func cancelItemLeftSetting() -> CubChildMethods
    
}
