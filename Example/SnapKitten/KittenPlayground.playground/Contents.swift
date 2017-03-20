//: Playground - noun: a place where people can play

import UIKit
import SnapKitten
import PlaygroundSupport

//var str = "Hello, playground"



let virtualView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 736))
virtualView.backgroundColor = UIColor.white

//uncomment this code if layout to not display
//PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = virtualView

let v1 = UIView()
let v2 = UIView()
let v3 = UIView()
let lblA = UILabel()
let lblB = UILabel()
let lblC = UILabel()
lblB.numberOfLines = 0
lblA.text = "Hello"
lblB.text = "!! gberi beribv ierbviernv ioernviorv ioerniovnerioreio nrv ierbiuehiuvb euieurv ueve h"
lblC.text = "World"

v1.backgroundColor = UIColor.red
v2.backgroundColor = UIColor.green
v3.backgroundColor = UIColor.blue

Kitten.create(.vertical).from(virtualView).isAlignDirectionEnd(true)
    .add(v1)
    .add(v2)
    .add(v3).fillParent()
    .build()

Kitten.create(.horizontal).from(v1).defaultAlignment(.start).allPadding(10).add(lblA).build()
Kitten.create(.horizontal).from(v2).add(lblB).build()
Kitten.create(.horizontal).from(v3).allPadding(10).add(lblC).build()