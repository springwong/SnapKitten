//: Playground - noun: a place where people can play

import UIKit
import SnapKitten
import PlaygroundSupport

let virtualView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
virtualView.backgroundColor = UIColor.gray
PlaygroundPage.current.liveView = virtualView

let iv = UIImageView()
iv.backgroundColor = UIColor.red
let lblA = UILabel()
lblA.text = "Hello World"

let simpleComponent = Kitten.horizontal().from()
.add(iv).size(40)
.add(lblA)
.build()
simpleComponent.backgroundColor = UIColor.green

Kitten.create(.vertical).from(virtualView)
    .add(simpleComponent).align(.start)
    .build()
