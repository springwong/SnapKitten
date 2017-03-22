//
//  IntrinicUIView.swift
//  Pods
//
//  Created by Spring Wong on 21/3/2017.
//
//

import UIKit

public class IntrinicUIView: UIView {

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 0)

//        return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
    }
}
