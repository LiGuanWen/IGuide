# IGuide

[![support](https://img.shields.io/badge/support-ios%209.0+-orange.svg)](#)
[![Version](https://img.shields.io/cocoapods/v/IGuide.svg?style=flat)](https://cocoapods.org/pods/IGuide)
[![License](https://img.shields.io/cocoapods/l/IGuide.svg?style=flat)](https://cocoapods.org/pods/IGuide)
[![Platform](https://img.shields.io/cocoapods/p/IGuide.svg?style=flat)](https://cocoapods.org/pods/IGuide)

A Library for making animated tutorials inside your app

## Preview

![preview](/preview.gif)![preview](/preview2.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+
- Objective-C

## Installation

IGuide is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IGuide'
```

## Usage

Conforms to the protocol 'IGuideViewControllerDataSource', and then calls

```ruby
[IGuideViewController showsWithDataSource:self];
```

## Author

* Github: [@whatsbug](https://github.com/whatsbug)

## License

IGuide is available under the MIT license. See the LICENSE file for more info.
