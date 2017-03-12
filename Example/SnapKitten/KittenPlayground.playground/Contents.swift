//: Playground - noun: a place where people can play

import UIKit
import SnapKitten
import PlaygroundSupport

var str = "Hello, playground"

PlaygroundPage.current.needsIndefiniteExecution = false

let container = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
container.backgroundColor = UIColor.blue

PlaygroundPage.current.liveView = container
let btn = UIButton()
btn.setTitle("Button", for: .normal)
btn.backgroundColor = .red

let lbl = UILabel()
lbl.text = "testing"
lbl.numberOfLines = 0
lbl.backgroundColor = UIColor.green

let lbl2 = UILabel()
lbl2.text = "122"
let btn2 = UIButton()
btn2.setTitle("Button", for: .normal)
btn2.backgroundColor = UIColor.brown
btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

let iv = UIImageView()
iv.backgroundColor = UIColor.black

let sv = UIScrollView()
Kitten.create(.vertical).from(container).isAlignDirectionEnd(true)
.add(sv).fillParent()
.build()

let component = Kitten.create(.horizontal).from().isAlignDirectionEnd(true)
//    .endPadding(10)
    .itemDefaultSidePadding(10)
    .defaultAlignment(.center)
    .add(iv).size(40, .equal)
    .add(lbl).priority(.medium)
    .add(UIView()).fillParent()
    .add(btn).itemOffset(5)
    .add(btn2).condition({false})
    .build()
component.backgroundColor = UIColor.yellow

Kitten.create(.vertical).from(sv)
.add(component)
.build()
