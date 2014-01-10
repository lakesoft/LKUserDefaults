# LKUserDefaults

[![Version](http://cocoapod-badges.herokuapp.com/v/LKUserDefaults/badge.png)](http://cocoadocs.org/docsets/LKUserDefaults)
[![Platform](http://cocoapod-badges.herokuapp.com/p/LKUserDefaults/badge.png)](http://cocoadocs.org/docsets/LKUserDefaults)

## Usage
Step 1 : Define subclass of LKUserDefaults

    #import "LKUserDefaults.h"

    @interface UserDefaults : LKUserDefaults
    @property (strong, nonatomic) NSString* name;
    @property (strong, nonatomic) NSString* email;
    @end

Step 2 : Access properties => done

    UserDefaults* defaults = [UserDefaults sharedInstance];
    defaults.name = @"Hoge";        // Write to NSUserDefaults for key "name"
        :
    NSString* name = defaults.name; // Read from NSUserDefaults for key "name"

It is possible to register default values ( use -[NSUserDefaults registerDefaults] ).

    - (void)registerDefaults
    {
        self.name = @"unkown";
        self.name = @"unkown@xcatsan.com";
    }

These value will be used as default values when the values for keys are notfound in NSUserDefaults.

It is possible to remove all values.

    [UserDefaults removeUserDefaults];


## Notes

- Property ARC attributes should be 'strong'.

## Installation

LKUserDefaults is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "LKUserDefaults"

## Author

Hiroshi Hashiguchi, xcatsan@mac.com

## License

LKUserDefaults is available under the MIT license. See the LICENSE file for more info.

