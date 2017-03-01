//
//  SnapKitten.swift
//  SnapKitten
//
//  Created by Spring Wong on 24/2/2017.
//  Copyright © 2017 Spring Wong. All rights reserved.
//

import UIKit
import SnapKit

public class Kitten : KittenParent, KittenParentMethods, KittenChildMethods, KittenBuild{
    internal var parent : UIView?
    internal var parentTop : ConstraintItem?
    internal var parentBottom : ConstraintItem?
    internal var parentLeft : ConstraintItem?
    internal var parentRight : ConstraintItem?
    internal var isAlignParentEnd : Bool = false
    internal var orientation : KittenOrientation
    internal var isWeightMode : Bool = false
    
    internal var startPadding : Int = 0
    internal var endPadding : Int = 0
    
    internal var childs : [KittenItem] = []
    internal var currentChild : KittenItem?
    
    internal var defaultAlignment : KittenAlignment = .parent
    internal var defaultItemOffset : Int = 0
    internal var defaultItemSideStartPadding : Int = 0
    internal var defaultItemSideEndPadding : Int = 0
    
    internal var minimumPriority = 1
    
    private init(_ orientation : KittenOrientation){
        self.orientation = orientation
    }
    static public func create(_ orientation : KittenOrientation) -> KittenParent{
        return Kitten(orientation)
    }
    public func from(_ parent : UIViewController) -> KittenParentMethods{
        self.parent = parent.view
        self.parentTop = parent.topLayoutGuide == nil ? parent.view.snp.top : parent.topLayoutGuide.snp.bottom
        self.parentBottom = parent.bottomLayoutGuide == nil ? parent.view.snp.bottom : parent.bottomLayoutGuide.snp.top
        self.parentLeft = parent.view.snp.left
        self.parentRight = parent.view.snp.right
        return self
    }
    public func from(_ parent : UIScrollView) -> KittenParentMethods{
        self.parent = UIView()
        parent.attachContentView(contentView : self.parent!, scrollOrientation : self.orientation)
        self.parentTop = self.parent?.snp.top
        self.parentBottom = self.parent?.snp.bottom
        self.parentLeft = self.parent?.snp.left
        self.parentRight = self.parent?.snp.right
        return self
    }
    public func from(_ parent : UIView) -> KittenParentMethods{
        self.parent = parent
        self.parentTop = parent.snp.top
        self.parentBottom = parent.snp.bottom
        self.parentLeft = parent.snp.left
        self.parentRight = parent.snp.right
        return self
    }
    public func from() -> KittenParentMethods{
        self.parent = UIView()
        if let parent = self.parent{
            self.parentTop = parent.snp.top
            self.parentBottom = parent.snp.bottom
            self.parentLeft = parent.snp.left
            self.parentRight = parent.snp.right
        }
        return self
    }
    public func parentTop(_ top : ConstraintItem) -> KittenParentMethods{
        self.parentTop = top
        return self
    }
    public func parentLeft(_ left : ConstraintItem) -> KittenParentMethods{
        self.parentLeft = left
        return self
    }
    public func parentBottom(_ bottom : ConstraintItem) -> KittenParentMethods{
        self.parentBottom = bottom
        return self
    }
    public func parentRight(_ right : ConstraintItem) -> KittenParentMethods{
        self.parentRight = right
        return self
    }
    public func defaultAlignment(_ alignment : KittenAlignment) -> KittenParentMethods{
        self.defaultAlignment = alignment
        return self
    }
    public func startPadding(_ value : Int) -> KittenParentMethods{
        self.startPadding = value
        return self
    }
    public func endPadding(_ value : Int) -> KittenParentMethods{
        self.endPadding = value
        return self
    }
    public func itemDefaultOffset(_ value : Int)->KittenParentMethods{
        self.defaultItemOffset = value
        return self
    }
    public func itemDefaultSideStartPadding(_ value : Int)->KittenParentMethods{
        self.defaultItemSideStartPadding = value
        return self
    }
    public func itemDefaultSideEndPadding(_ value : Int)->KittenParentMethods{
        self.defaultItemSideEndPadding = value
        return self
    }
    public func isAlignDirectionEnd(_ isAlign : Bool) -> KittenParentMethods{
        self.isAlignParentEnd = isAlign
        return self
    }

    public func weightMode(_ isOn : Bool) -> KittenParentMethods{
        self.isWeightMode = isOn
        return self
    }
    
    public func add(_ child : UIView) -> KittenChildMethods{
        let item = KittenItem(child: child, alignment : defaultAlignment)
        item.sideStartPadding = defaultItemSideStartPadding
        item.sideEndPadding = defaultItemSideEndPadding
        item.itemOffset = defaultItemOffset
        childs.append(item)
        self.currentChild = item
        return self
    }
    public func addChilds(_ childs : UIView ...) -> KittenChildMethods{
        for child in childs{
            _ = add(child)
        }
        return self
    }
    public func with(_ child: UIView) -> KittenChildMethods {
        for item in childs{
            if child.isEqual(item.view){
                self.currentChild = item
                return self
            }
        }
        debugPrint("SnapKitten Object with(child) : \(child.description) is not exist, current editing target remains")
        return self
    }
    public func fillParent() -> KittenChildMethods{
        currentChild?.isFillParent = true
        return self
    }
    public func itemOffset(_ value : Int) -> KittenChildMethods{
        self.currentChild?.itemOffset = value
        return self
    }
    public func sideStartPadding(_ value : Int) -> KittenChildMethods{
        self.currentChild?.sideStartPadding = value
        return self
    }
    public func sideEndPadding(_ value : Int) -> KittenChildMethods{
        self.currentChild?.sideEndPadding = value
        return self
    }
    public func ratio(_ ratio : Float) -> KittenChildMethods{
        self.currentChild?.ratio = ratio
        return self
    }
    public func align(_ alignment : KittenAlignment) -> KittenChildMethods{
        self.currentChild?.alignment = alignment
        return self
    }
    public func condition(_ condition : @escaping KittenInsertCondition) -> KittenChildMethods{
        self.currentChild?.insertCondition = condition
        return self
    }
    public func width(_ value : Int?, _ condition : KittenSign = .equal) -> KittenChildMethods{
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        return self
    }
    public func height(_ value : Int?, _ condition : KittenSign = .equal) -> KittenChildMethods{
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        return self
    }
    public func size(_ value: Int?, _ condition : KittenSign = .equal) -> KittenChildMethods {
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        return self
    }
    public func priority(_ priority : KittenPriority) -> KittenChildMethods{
        self.currentChild?.priority = priority
        return self
    }
    public func weight(_ value : Float) -> KittenChildMethods{
        self.currentChild?.weight = value
        return self
    }
    internal func preBuild() -> [KittenItem]{
//        parent?.translatesAutoresizingMaskIntoConstraints = false
        return childs.filter({ (item) -> Bool in
            if let condition = item.insertCondition{
                if !condition(){
                    return false
                }
            }
            return true
        })
    }
    public func build() -> UIView{
        mixBuild()
        return parent!
    }
    
    public func rebuild() -> UIView{
        for subview in (parent?.subviews)!{
            subview.removeFromSuperview()
            subview.snp.removeConstraints()
        }
        return build()
    }
    private func mixBuild(){
        let insertItems = preBuild()
        var previousChild : UIView?
        let totalWeight : Float? = childs.first?.weight
        insertItems.forEach { (child) in
            parent?.addSubview(child.view)
            child.view.snp.makeConstraints({ (make) in
                let start = orientation == .vertical ? make.top : make.left
                let end = orientation == .vertical ? make.bottom : make.right
                let lastEnd = orientation == .vertical ? previousChild?.snp.bottom : previousChild?.snp.right
                let parentEnd = orientation == .vertical ? parentBottom : parentRight
                let parentStart = orientation == .vertical ? parentTop : parentLeft
                let orientationLength = orientation == .vertical ? make.height : make.width
                let perpendicularLength = orientation == .vertical ? make.width : make.height
                let orientationChildSize = orientation == .vertical ? child.height : child.width
                let perpendicularChildSize = orientation == .vertical ? child.width : child.height
                updateCompressionResistance(orientation == .vertical ? .vertical : .horizontal, child)
                updateAlignment(
                    orientation == .vertical ? make.left : make.top
                    , orientation == .vertical ? make.right : make.bottom
                    , orientation == .vertical ? make.centerX : make.centerY
                    , child)
                if isWeightMode{
                    if insertItems.first?.view == child.view{
                        start.equalToSuperview().offset(startPadding)
                    }else{
                        start.equalTo(lastEnd!).offset(child.itemOffset)
                        orientationLength.equalTo((insertItems.first?.view)!).multipliedBy(child.weight / totalWeight!)
                    }
                    if (insertItems.last?.view == (child.view)){
                        end.equalTo(parentEnd!).offset(-endPadding)
                    }
                }else{
                    if (insertItems.first?.view == (child.view)) {
                        start.equalTo(parentStart!).offset(startPadding)
                    }else{
                        start.equalTo(lastEnd!).offset(child.itemOffset)
                    }
                    if (insertItems.last?.view == (child.view)){
                        if isAlignParentEnd{
                            end.equalTo(parentEnd!).offset(-endPadding)
                        }else{
                            end.lessThanOrEqualTo(parentEnd!).offset(-endPadding)
                        }
                    }
                    updateSize(orientationLength, orientationChildSize)
                }
                updateSize(perpendicularLength, perpendicularChildSize)
                if child.isFillParent{
                    orientationLength.equalToSuperview().priority(1)
                    orientationLength.lessThanOrEqualToSuperview()
                }
                
                //todo : rethink if this feature appropriate
//                if let ratio = child.ratio{
//                    make.height.lessThanOrEqualTo((parent?.snp.width)!).multipliedBy(ratio)
//                }
                previousChild = child.view
            })
        }
    }
    private func updateCompressionResistance(_ axis : UILayoutConstraintAxis, _ child : KittenItem){
        switch child.priority {
        case .low:
            child.view.setContentCompressionResistancePriority(1, for: axis)
        case .medium:
            child.view.setContentCompressionResistancePriority(200, for: axis)
        case .high:
            child.view.setContentCompressionResistancePriority(1000, for: axis)
        }
    }
    private func updateAlignment(_ start : ConstraintMakerExtendable, _ end : ConstraintMakerExtendable, _ center : ConstraintMakerExtendable, _ child : KittenItem){
        switch child.alignment{
        case .start:
            start.equalToSuperview().offset(child.sideStartPadding)
            end.lessThanOrEqualToSuperview().offset(-child.sideEndPadding)
        case .end:
            start.greaterThanOrEqualToSuperview().offset(child.sideStartPadding)
            end.equalToSuperview().offset(-child.sideEndPadding)
        case .center:
            center.equalToSuperview()
            start.greaterThanOrEqualToSuperview().offset(child.sideStartPadding)
            end.lessThanOrEqualToSuperview().offset(-child.sideEndPadding)
        case .parent:
            start.equalToSuperview().offset(child.sideStartPadding)
            end.equalToSuperview().offset(-child.sideEndPadding)
        }
    }
    private func updateSize(_ extendable : ConstraintMakerExtendable, _ condition : KittenDimension?){
        if let condition = condition{
            if let value = condition.value{
                switch condition.condition {
                case .equal:
                    extendable.equalTo(value)
                case .max:
                    extendable.lessThanOrEqualTo(value)
                case .min:
                    extendable.greaterThanOrEqualTo(value)
                }
            }
        }
    }
}
