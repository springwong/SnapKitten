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
    internal weak var container : UIView?
    internal weak var parent : UIView?
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
    
    private init(_ orientation : KittenOrientation){
        self.orientation = orientation
    }
    @discardableResult static public func create(_ orientation : KittenOrientation) -> KittenParent{
        return Kitten(orientation)
    }
    @discardableResult static public func horizontal() -> KittenParent {
        return Kitten(.horizontal)
    }
    @discardableResult static public func vertical() -> KittenParent {
        return Kitten(.vertical)
    }
    @discardableResult public func from(_ parent : UIViewController) -> KittenParentMethods{
        self.container = parent.view
        self.parentTop = parent.topLayoutGuide.snp.bottom
        self.parentBottom = parent.bottomLayoutGuide.snp.top
        self.parentLeft = parent.view.snp.left
        self.parentRight = parent.view.snp.right
        return self
    }
    @discardableResult public func from(_ parent : UIScrollView) -> KittenParentMethods{
        self.parent = parent
        return self
    }
    @discardableResult public func from(_ parent : UIView) -> KittenParentMethods{
        self.container = parent
        self.parentTop = parent.snp.top
        self.parentBottom = parent.snp.bottom
        self.parentLeft = parent.snp.left
        self.parentRight = parent.snp.right
        return self
    }
    @discardableResult public func from() -> KittenParentMethods{
        return self
    }
    @discardableResult public func parentTop(_ top : ConstraintItem) -> KittenParentMethods{
        self.parentTop = top
        return self
    }
    @discardableResult public func parentLeft(_ left : ConstraintItem) -> KittenParentMethods{
        self.parentLeft = left
        return self
    }
    @discardableResult public func parentBottom(_ bottom : ConstraintItem) -> KittenParentMethods{
        self.parentBottom = bottom
        return self
    }
    @discardableResult public func parentRight(_ right : ConstraintItem) -> KittenParentMethods{
        self.parentRight = right
        return self
    }
    @discardableResult public func defaultAlignment(_ alignment : KittenAlignment) -> KittenParentMethods{
        self.defaultAlignment = alignment
        return self
    }
    @discardableResult public func startPadding(_ value : Int) -> KittenParentMethods{
        self.startPadding = value
        return self
    }
    @discardableResult public func endPadding(_ value : Int) -> KittenParentMethods{
        self.endPadding = value
        return self
    }
    @discardableResult public func itemDefaultOffset(_ value : Int)->KittenParentMethods{
        self.defaultItemOffset = value
        return self
    }
    @discardableResult public func itemDefaultSideStartPadding(_ value : Int)->KittenParentMethods{
        self.defaultItemSideStartPadding = value
        return self
    }
    @discardableResult public func itemDefaultSideEndPadding(_ value : Int)->KittenParentMethods{
        self.defaultItemSideEndPadding = value
        return self
    }
    @discardableResult public func itemDefaultSidePadding(_ value : Int) -> KittenParentMethods{
        self.defaultItemSideEndPadding = value
        self.defaultItemSideStartPadding = value
        return self
    }
    @discardableResult public func allPadding(_ value : Int)->KittenParentMethods{
        self.defaultItemSideEndPadding = value
        self.defaultItemSideStartPadding = value
        self.startPadding = value
        self.endPadding = value
        return self
    }
    @discardableResult public func isAlignDirectionEnd(_ isAlign : Bool) -> KittenParentMethods{
        self.isAlignParentEnd = isAlign
        return self
    }

    @discardableResult public func weightMode(_ isOn : Bool) -> KittenParentMethods{
        self.isWeightMode = isOn
        return self
    }
    
    @discardableResult public func add(_ child : UIView) -> KittenChildMethods{
        let item = KittenItem(child: child, alignment : defaultAlignment)
        item.sideStartPadding = defaultItemSideStartPadding
        item.sideEndPadding = defaultItemSideEndPadding
        item.itemOffset = defaultItemOffset
        childs.append(item)
        self.currentChild = item
        return self
    }
    @discardableResult public func addChilds(_ childs : UIView ...) -> KittenChildMethods{
        for child in childs{
            _ = add(child)
        }
        return self
    }
    @discardableResult public func addChilds(_ childs : [UIView]) -> KittenChildMethods{
        for child in childs{
            _ = add(child)
        }
        return self
    }
    
    @discardableResult public func removeChild(_ child : UIView) -> KittenChild {
        var index = 0
        for item in childs {
            if child.isEqual(item.view) {
                self.childs.remove(at: index)
                break
            }
            index += 1
        }
        return self
    }
    @discardableResult public func removeAllChild() -> KittenChild {
        childs.removeAll()
        return self
    }
    @discardableResult public func with(_ child: UIView) -> KittenChildMethods {
        for item in childs{
            if child.isEqual(item.view){
                self.currentChild = item
                return self
            }
        }
        debugPrint("SnapKitten Object with(child) : \(child.description) is not exist, current editing target remains")
        return self
    }
    //as it originally no parameter, true as default
    @discardableResult public func fillParent() -> KittenChildMethods{
        currentChild?.isFillParent = true
        //will not compress other item in default
        currentChild?.priority = .medium
        return self
    }
    @discardableResult public func fitSize() -> KittenChildMethods {
        //reverse fillParent setting
        currentChild?.isFillParent = false
        currentChild?.priority = .high
        return self
    }
    @discardableResult public func itemOffset(_ value : Int) -> KittenChildMethods{
        self.currentChild?.itemOffset = value
        return self
    }
    @discardableResult public func sideStartPadding(_ value : Int) -> KittenChildMethods{
        self.currentChild?.sideStartPadding = value
        return self
    }
    @discardableResult public func sideEndPadding(_ value : Int) -> KittenChildMethods{
        self.currentChild?.sideEndPadding = value
        return self
    }
    @discardableResult public func sidePadding(_ value : Int) -> KittenChildMethods{
        self.currentChild?.sideEndPadding = value
        self.currentChild?.sideStartPadding = value
        return self
    }
    //not implement currently
//    public func ratio(_ ratio : Float) -> KittenChildMethods{
//        self.currentChild?.ratio = ratio
//        return self
//    }
    @discardableResult public func align(_ alignment : KittenAlignment) -> KittenChildMethods{
        self.currentChild?.alignment = alignment
        return self
    }
    @discardableResult public func alignSideStart() -> KittenChildMethods {
        self.currentChild?.alignment = .start
        return self
    }
    @discardableResult public func alignSideEnd() -> KittenChildMethods {
        self.currentChild?.alignment = .end
        return self
    }
    @discardableResult public func alignSideCenter() -> KittenChildMethods {
        self.currentChild?.alignment = .center
        return self
    }
    @discardableResult public func alignSideParent() -> KittenChildMethods {
        self.currentChild?.alignment = .parent
        return self
    }
    @discardableResult public func condition(_ condition : @escaping KittenInsertCondition) -> KittenChildMethods{
        self.currentChild?.insertCondition = condition
        return self
    }
    @discardableResult public func width(_ value : Int?, _ condition : KittenSign = .equal) -> KittenChildMethods{
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        return self
    }
    @discardableResult public func width(_ value : Int?) -> KittenChildMethods {
        self.currentChild?.width = KittenDimension(value: value, condition: .equal)
        return self
    }
    @discardableResult public func height(_ value : Int?) -> KittenChildMethods {
        self.currentChild?.height = KittenDimension(value: value, condition: .equal)
        return self
    }
    @discardableResult public func size(_ value : Int?) -> KittenChildMethods {
        self.currentChild?.width = KittenDimension(value: value, condition: .equal)
        self.currentChild?.height = KittenDimension(value: value, condition: .equal)
        return self
    }
    @discardableResult public func height(_ value : Int?, _ condition : KittenSign = .equal) -> KittenChildMethods{
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        return self
    }
    @discardableResult public func size(_ value: Int?, _ condition : KittenSign = .equal) -> KittenChildMethods {
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        return self
    }
    @discardableResult public func priority(_ priority : KittenPriority) -> KittenChildMethods{
        self.currentChild?.priority = priority
        return self
    }
    @discardableResult public func importanceHigh() -> KittenChildMethods {
        self.currentChild?.priority = .high
        return self
    }
    @discardableResult public func importanceMedium() -> KittenChildMethods {
        self.currentChild?.priority = .medium
        return self
    }
    @discardableResult public func importanceLow() -> KittenChildMethods {
        self.currentChild?.priority = .low
        return self
    }
    @discardableResult public func weight(_ value : Float) -> KittenChildMethods{
        self.currentChild?.weight = value
        return self
    }
    @discardableResult public func sideCompressionResistanceHigh() -> KittenChildMethods {
        self.currentChild?.sideCompressionResistance = 1000
        return self
    }
    @discardableResult public func sideCompressionResistanceMedium() -> KittenChildMethods {
        self.currentChild?.sideCompressionResistance = 750
        return self
    }
    @discardableResult public func sideCompressionResistanceLow() -> KittenChildMethods {
        self.currentChild?.sideCompressionResistance = 250
        return self
    }
    internal func preBuild() -> [KittenItem]{
        return childs.filter({ (item) -> Bool in
            if let condition = item.insertCondition{
                if !condition(){
                    return false
                }
            }
            return true
        })
    }
    @discardableResult public func build() -> UIView{
        return mixBuild()
    }
    
    @discardableResult public func rebuild() -> UIView{
        if let container = container {
            for subview in (container.subviews){
                if(!NSStringFromClass(type(of: subview)).contains("_UILayoutGuide")){
                    subview.snp.removeConstraints()
                    container.invalidateIntrinsicContentSize()
                    subview.removeFromSuperview()
                }
            }
        }
        return build()
    }
    private func mixBuild() -> UIView{
        var view : UIView?
        if container == nil {
            if let _ = parent as? UIScrollView {
                view = UIView()
            }else{
                view = IntrinsicUIView()
            }
            container = view
            parentTop = container?.snp.top
            parentBottom = container?.snp.bottom
            parentLeft = container?.snp.left
            parentRight = container?.snp.right
        }
        let insertItems = preBuild()
        var previousChild : UIView?
        let totalWeight : Float? = childs.first?.weight
        insertItems.forEach { (child) in
            container?.addSubview(child.view)
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
                        start.equalTo(parentStart!).offset(startPadding)
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
                    KittenCommonMethod.updateSize(orientationLength, orientationChildSize)
                }
                KittenCommonMethod.updateSize(perpendicularLength, perpendicularChildSize)
                if child.isFillParent{
                    child.view.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: orientation == .vertical ? .vertical : .horizontal)
                }else{
                    child.view.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: orientation == .vertical ? .vertical : .horizontal)
                }
                
                child.view.setContentCompressionResistancePriority(UILayoutPriority(Float(child.sideCompressionResistance)), for: orientation == .vertical ? .horizontal : .vertical)
                
                //todo : rethink if this feature appropriate
//                if let ratio = child.ratio{
//                    make.height.lessThanOrEqualTo((parent?.snp.width)!).multipliedBy(ratio)
//                }
                previousChild = child.view
            })
        }
        //if parent exist and it's scrollview, add container to scrollview
        if let parent = parent as? UIScrollView {
            if container?.superview == nil {
                parent.addSubview(container!)
                container?.snp.makeConstraints { (make) in
                    switch orientation{
                    case .vertical:
                        make.width.equalToSuperview()
                        make.left.right.equalToSuperview()
                        make.top.bottom.equalToSuperview()
                    case .horizontal:
                        make.height.equalToSuperview()
                        make.top.bottom.equalToSuperview()
                        make.left.right.equalToSuperview()
                    }
                }
            }
        }
        return container!
    }
    private func updateCompressionResistance(_ axis : NSLayoutConstraint.Axis, _ child : KittenItem){
        switch child.priority {
        case .low:
            child.view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 100), for: axis)
        case .medium:
            //notes : 250 and 251 is a special point which will make behaviour greate different
            //250 make item totally compressed if three item align together without no align parent in its higher Kitten level
            child.view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 500), for: axis)
        case .high:
            child.view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 900), for: axis)
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
}
