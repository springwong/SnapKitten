# SnapKitten

SnapKitten is a Linear Layout Solution Library based on SnapKit and Auto Layout.

[![CI Status](http://img.shields.io/travis/Spring Wong/SnapKitten.svg?style=flat)](https://travis-ci.org/Spring Wong/SnapKitten)
[![Version](https://img.shields.io/cocoapods/v/SnapKitten.svg?style=flat)](http://cocoapods.org/pods/SnapKitten)
[![License](https://img.shields.io/cocoapods/l/SnapKitten.svg?style=flat)](http://cocoapods.org/pods/SnapKitten)
[![Platform](https://img.shields.io/cocoapods/p/SnapKitten.svg?style=flat)](http://cocoapods.org/pods/SnapKitten)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#Usage

```ruby
import SnapKitten

class ViewController: UIViewController {
    lazy var textViewA = UILabel()
    lazy var textViewB = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Some visual update on textView
        updateUI()
        _ = Kitten.create(.vertical).from(self)
            .add(textViewA)
            .add(textViewB)
            .build()
    }
```

### How do use Kitten class?

Kitten class is a assistant library to break down complex UI component to simple linear design.
Kitten always think layout as top to bottom (vertical) or left to right (horizontal)
By handle constraint system, it achieve android linear layout like behaviour

```ruby
	override func viewDidLoad(){
		super.viewDidLoad()
		//create is only valid init function in Kitten, and to define the direction of your layour
		//create return KittenParent which limited the method you can use
		Kitten.create(.vertical)
		//from method accept empty/View/ScrollView/UIViewController *bind to topLayoutGuide and bottomLayoutGuide
		//from method return KittenParentMethods to define some default value or switch mode
		.from(someView)
		//padding with its parent, for vertical, it's top , for horizontal, it's left
		//for vertical, your first view is top + 10 in position
		.startPadding(10)
		//a perpendicular padding of each item, for vertical, it's left, for horizontal, it's top
		.itemDefaultSideStartPadding(10)
		//add a textView to Kitten, note that textView is not yet added to its parent here, all constraint is setup when build() / rebuild() method call
		.add(textView)
		//textView align start of perpendicular direction.
		//for vertical, it's align left
		//there are start, center, end, parent for usage
		.align(.start)
		.add(anotherTextView)
		//the offset with previous item, itemOffset is not affected layout if child is first item of childs
		.itemOffset(10)
		//build method will auto generate all constraint relationship between those items, and return the container of childs, if no parent in from() method, it will generate a new one
		.build()

		//you can always redefine return object as Kitten class to do what
		let kitten = Kitten.create(.horizontal) as! Kitten

	}
```

## Requirements
- iOS 8.0+

## Installation

SnapKitten is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SnapKitten"
```

## Author

Spring Wong, rudolphwong2002@gmail.com

## License

SnapKitten is available under the MIT license. See the LICENSE file for more info.
