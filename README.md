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
