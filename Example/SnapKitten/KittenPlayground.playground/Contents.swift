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
lblA.backgroundColor = UIColor.blue

let iv2 = UIImageView()
iv2.backgroundColor = UIColor.red
let iv3 = UIImageView()
iv3.backgroundColor = UIColor.blue
let lbl2 = UILabel()
lbl2.backgroundColor = UIColor.green
lbl2.text = "short text"

let simpleComponent = Kitten.horizontal().from()
.add(iv).size(40)
.add(lblA).itemOffset(10)
.build()
simpleComponent.backgroundColor = UIColor.green

let threeComponentExample = Kitten.horizontal()
.from().isAlignDirectionEnd(true).defaultAlignment(.center)
.add(iv2).size(40)
.add(lbl2).fillParent()
.add(iv3).size(60).condition({ () -> Bool in
    return false
})
.build()
threeComponentExample.backgroundColor = UIColor.orange

Kitten.create(.vertical).from(virtualView)
    .add(simpleComponent).align(.start)
    .add(threeComponentExample)
    .build()
