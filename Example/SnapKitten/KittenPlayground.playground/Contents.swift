//: Playground - noun: a place where people can play

import UIKit
import SnapKitten
import PlaygroundSupport

var str = "Hello, playground"

PlaygroundPage.current.needsIndefiniteExecution = true

let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

PlaygroundPage.current.liveView = container
let btn = UIButton()
btn.setTitle("Hello", for: .normal)
btn.backgroundColor = UIColor.red

let lbl = UILabel()
lbl.text = "testing 1234 knsdvnkvnw  nekwlnelwk"
lbl.numberOfLines = 0
lbl.backgroundColor = UIColor.green

Kitten.create(.horizontal).from(container).isAlignDirectionEnd(true).endPadding(10)
    .defaultAlignment(.parent)
    .add(lbl).priority(.medium).fillParent()
//    .add(UIView()).fillParent()
    .add(btn).itemOffset(5)
    .build()