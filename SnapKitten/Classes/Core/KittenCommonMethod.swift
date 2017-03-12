//
//  KittenCommonMethod.swift
//  Pods
//
//  Created by Spring Wong on 12/3/2017.
//
//

import Foundation
import SnapKit

internal class KittenCommonMethod {
    internal static func updateSize(_ extendable : ConstraintMakerExtendable, _ condition : KittenDimension?){
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
