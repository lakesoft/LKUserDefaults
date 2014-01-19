# LKUserDefaults

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

It is possible to register default values.

    - (void)registerDefaults
    {
        self.name = @"unkown";
        self.email = @"unkown@xcatsan.com";
    }

These value will be used as default values when the values for keys are notfound in NSUserDefaults.

It is possible to remove all values.

    [UserDefaults removeUserDefaults];

Types:

    @property (assign, nonatomic) BOOL boolValue;
    @property (assign, nonatomic) NSInteger integerValue;
    @property (assign, nonatomic) float floatValue;
    @property (assign, nonatomic) double doubleValue;

    @property (strong, nonatomic) NSString* stringValue;
    @property (strong, nonatomic) NSArray* arrayValue;
    @property (strong, nonatomic) NSArray* stringArrayValue;
    @property (strong, nonatomic) NSDictionary* dictionaryValue;
    @property (strong, nonatomic) NSData* dataValue;
    @property (strong, nonatomic) NSURL* urlValue;
    @property (strong, nonatomic) NSDate* dateValue;

## Notes

- Property ARC attributes should be 'strong'.

## Installation

LKUserDefaults is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "LKUserDefaults", :git => 'https://github.com/lakesoft/LKUserDefaults.git'

## Author

Hiroshi Hashiguchi, xcatsan@mac.com

## License

LKUserDefaults is available under the MIT license. See the LICENSE file for more info.

