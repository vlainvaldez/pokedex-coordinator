# FFuFArchitecture
FFuFArchitecture is the default Cocoapod used in general iOS applications for Feil, Feil, & Feil

See GUIDELINES.md for more guidance

## Requirements

FFuFArchitecture required iOS 9.3 or newer and Swift 3.x or newer

## Installation

FFuFArchitecture is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!
platform :ios, '9.3'

source 'https://bitbucket.org/FFUF/ffuf-ios-architecture.git'
source 'https://bitbucket.org/FFUF/ffuf-ios-architecture-fswiftnetworking.git'
source 'https://bitbucket.org/FFUF/ffuf-ios-architecture-fswiftparser.git'
source 'https://github.com/CocoaPods/Specs.git'

target 'FFuFArchitecture_Tests' do
  pod 'FFuFArchitecture'
end
```

## Author

Julio Alorro, julio.alorro@ffuf.de

## License

FFuFArchitecture is available under the MIT license. See the LICENSE file for more info.
