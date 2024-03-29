//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A subclass of UIViewController that implements a print statement when deinitialized. 
 Conforms to NavigationItemSetting and TargetActionSetting.
*/
open class JAViewController: UIViewController, NavigationItemSetting, TargetActionSetting {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
