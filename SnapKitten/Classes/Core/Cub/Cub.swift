//
//  Cub.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation
import SnapKit

public class Cub : CubParent, CubParentMethods, CubChildMethods, CubChild{
    internal var parent : UIView?
    internal var parentTop : ConstraintItem?
    internal var parentBottom : ConstraintItem?
    internal var parentLeft : ConstraintItem?
    internal var parentRight : ConstraintItem?
    
    internal var childs : [CubItem] = []
    internal var currentChild : CubItem?
    
    internal var defaultTopOffset : Int = 0
    internal var defaultLeftOffset : Int = 0
    internal var defaultRigthOffset : Int = 0
    internal var defaultBottomOffset : Int = 0

    private init(){
        
    }
    @discardableResult static public func create() -> CubParent{
        return Cub()
    }
    
    @discardableResult
    public func from() -> CubParentMethods {
        return from(UIView())
    }
    
    @discardableResult
    public func from(_ parent: UIView) -> CubParentMethods {
        self.parent = parent
        self.parentTop = parent.snp.top
        self.parentBottom = parent.snp.bottom
        self.parentLeft = parent.snp.left
        self.parentRight = parent.snp.right
        return self
    }
    
    @discardableResult
    public func from(_ parent: UIViewController) -> CubParentMethods {
        self.parent = parent.view
        self.parentTop = parent.topLayoutGuide.snp.bottom
        self.parentBottom = parent.bottomLayoutGuide.snp.top
        self.parentLeft = parent.view.snp.left
        self.parentRight = parent.view.snp.right
        return self
    }
    
    @discardableResult
    public func defaultOffset(_ value: Int) -> CubParentMethods {
        defaultTopOffset = value
        defaultLeftOffset = value
        defaultRigthOffset = value
        defaultBottomOffset = value
        return self
    }
    
    @discardableResult
    public func add(_ child: UIView) -> CubChildMethods {
        let newChild = CubItem(view: child)
        newChild.leftOffset = defaultLeftOffset
        newChild.rightOffset = defaultRigthOffset
        newChild.bottomOffset = defaultBottomOffset
        newChild.topOffset = defaultTopOffset
        childs.append(newChild)
        currentChild = newChild
        return self
    }
    
    @discardableResult
    public func with(_ child: UIView) -> CubChildMethods {
        for item in childs{
            if child.isEqual(item.view){
                self.currentChild = item
                return self
            }
        }
        debugPrint("SnapKitten Cub Object with(child) : \(child.description) is not exist, current editing target remains")
        return self
    }
    
    @discardableResult
    public func centerY(_ isCenter: Bool) -> CubChildMethods {
        currentChild?.isCenterY = isCenter
        return self
    }
    
    @discardableResult
    public func centerX(_ isCenter: Bool) -> CubChildMethods {
        currentChild?.isCenterX = isCenter
        return self
    }
    
    @discardableResult
    public func center(_ isCenter: Bool) -> CubChildMethods {
        currentChild?.isCenter = isCenter
        return self
    }
    
    @discardableResult
    public func rightOf(_ target: UIView) -> CubChildMethods {
        currentChild?.leftAction = CubRelativeAction(target: target, action: .rightOf)
        return self
    }
    
    @discardableResult
    public func leftOf(_ target: UIView) -> CubChildMethods {
        currentChild?.rightAction = CubRelativeAction(target: target, action: .leftOf)
        return self
    }
    
    @discardableResult
    public func below(_ target: UIView) -> CubChildMethods {
        currentChild?.topAction = CubRelativeAction(target: target, action: .below)
        return self
    }
    
    @discardableResult
    public func above(_ target: UIView) -> CubChildMethods {
        currentChild?.bottomAction = CubRelativeAction(target: target, action: .above)
        return self
    }
    
    @discardableResult
    public func alignBottom(_ target: UIView) -> CubChildMethods {
        currentChild?.bottomAction = CubRelativeAction(target: target, action: .alignBottom)
        return self
    }
    
    @discardableResult
    public func alignRight(_ target: UIView) -> CubChildMethods {
        currentChild?.rightAction = CubRelativeAction(target: target, action: .alignRight)
        return self
    }
    
    @discardableResult
    public func alignTop(_ target: UIView) -> CubChildMethods {
        currentChild?.topAction = CubRelativeAction(target: target, action: .alignTop)
        return self
    }
    
    @discardableResult
    public func alignLeft(_ target: UIView) -> CubChildMethods {
        currentChild?.leftAction = CubRelativeAction(target: target, action: .alignLeft)
        return self
    }
    
    @discardableResult
    public func alignParentRight() -> CubChildMethods {
        currentChild?.rightAction = CubRelativeAction(target: nil, action: .alignParentRight)
        return self
    }
    
    @discardableResult
    public func alignParentLeft() -> CubChildMethods {
        currentChild?.leftAction = CubRelativeAction(target: nil, action: .alignParentLeft)
        return self
    }
    
    @discardableResult
    public func alignParentBottom() -> CubChildMethods {
        currentChild?.bottomAction = CubRelativeAction(target: nil, action: .alignParentBottom)
        return self
    }
    
    @discardableResult
    public func alignParentTop() -> CubChildMethods {
        currentChild?.topAction = CubRelativeAction(target: nil, action: .alignParentTop)
        return self
    }
    
    @discardableResult
    public func offset(_ value: Int) -> CubChildMethods {
        self.currentChild?.topOffset = value
        self.currentChild?.bottomOffset = value
        self.currentChild?.leftOffset = value
        self.currentChild?.rightOffset = value
        return self
    }
    
    @discardableResult
    public func rightOffset(_ value: Int) -> CubChildMethods {
        self.currentChild?.rightOffset = value
        return self
    }
    
    @discardableResult
    public func leftOffset(_ value: Int) -> CubChildMethods {
        self.currentChild?.leftOffset = value
        return self
    }
    
    @discardableResult
    public func topOffset(_ value: Int) -> CubChildMethods {
        self.currentChild?.topOffset = value
        return self
    }
    
    @discardableResult
    public func bottomOffset(_ value: Int) -> CubChildMethods {
        self.currentChild?.bottomOffset = value
        return self
    }
    
    @discardableResult
    public func size(_ value: Int?, _ condition: KittenSign) -> CubChildMethods {
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        return self
    }
    
    @discardableResult
    public func height(_ value: Int?, _ condition: KittenSign) -> CubChildMethods {
        self.currentChild?.height = KittenDimension(value: value, condition: condition)
        return self
    }
    
    @discardableResult
    public func width(_ value: Int?, _ condition: KittenSign) -> CubChildMethods {
        self.currentChild?.width = KittenDimension(value: value, condition: condition)
        return self
    }
    
    @discardableResult
    public func build() -> UIView{
        //add all views into parent first for  relative
        childs.forEach { (child) in
            parent?.addSubview(child.view)
        }
        childs.forEach { (child) in
            let childView = child.view
            var isTopAssigned = false
            var isLeftAssigned = false
            var isRightAssigned = false
            var isBottomAssigned = false
            childView.snp.makeConstraints({ (make) in
                if child.isCenter {
                    make.center.equalToSuperview()
                }
                if child.isCenterX {
                    make.centerX.equalToSuperview()
                }
                if child.isCenterY {
                    make.centerY.equalToSuperview()
                }
                if let action = child.topAction {
                    if action.action == .alignTop {
                        make.top.equalTo(action.target!).offset(child.topOffset)
                    }
                    else if action.action == .below {
                        make.top.equalTo(action.target!.snp.bottom).offset(child.topOffset)
                    }
                    else if action.action == .alignParentTop {
                        make.top.equalToSuperview().offset(child.topOffset)
                    }
                    isTopAssigned = true
                }
                if let action = child.bottomAction {
                    if action.action == .alignBottom {
                        make.bottom.equalTo(action.target!).offset(-1*child.bottomOffset)
                    }
                    else if action.action == .above {
                        make.bottom.equalTo(action.target!.snp.top).offset(-1*child.bottomOffset)
                    }
                    else if action.action == .alignParentBottom {
                        make.bottom.equalToSuperview().offset(-1*child.bottomOffset)
                    }
                    isBottomAssigned = true
                }
                if let action = child.leftAction {
                    if action.action == .alignLeft {
                        make.left.equalTo(action.target!).offset(child.leftOffset)
                    }
                    else if action.action == .rightOf {
                        make.left.equalTo(action.target!.snp.right).offset(child.leftOffset)
                    }
                    else if action.action == .alignParentLeft {
                        make.left.equalToSuperview().offset(child.leftOffset)
                    }
                    isLeftAssigned = true
                }
                if let action = child.rightAction {
                    if action.action == .alignRight {
                        make.right.equalTo(action.target!).offset(-1*child.rightOffset)
                    }
                    else if action.action == .leftOf {
                        make.right.equalTo(action.target!.snp.left).offset(-1*child.rightOffset)
                    }
                    else if action.action == .alignParentRight {
                        make.right.equalToSuperview().offset(-1*child.rightOffset)
                    }
                    isRightAssigned = true
                }
                if !isTopAssigned {
                    make.top.equalToSuperview().offset(child.topOffset).priority(1)
                    make.top.greaterThanOrEqualToSuperview().offset(child.topOffset)
                }
                if !isLeftAssigned {
                    make.left.equalToSuperview().offset(child.leftOffset).priority(1)
                    make.left.greaterThanOrEqualToSuperview().offset(child.leftOffset)
                }
                if !isBottomAssigned {
                    make.bottom.lessThanOrEqualToSuperview().offset(-1 * child.bottomOffset)
                }
                if !isRightAssigned {
                    make.right.lessThanOrEqualToSuperview().offset(-1 * child.rightOffset)
                }
                
                KittenCommonMethod.updateSize(make.width, child.width)
                KittenCommonMethod.updateSize(make.height, child.height)
            })
        }
        return parent!
    }
    
    @discardableResult
    public func rebuild() -> UIView {
        return build()
    }
}
