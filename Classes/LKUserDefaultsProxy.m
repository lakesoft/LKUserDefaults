//
//  LKUserDefaultsProxy.m
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKUserDefaultsProxy.h"
#import "LKUserDefaults.h"

@interface LKUserDefaultsProxy()
@property (weak, nonatomic) LKUserDefaults* registerDefaults;
@end

@implementation LKUserDefaultsProxy

#pragma mark - API
- (id)initWithUserDefaults:(LKUserDefaults*)userDefaults
{
    self = [super initWithTarget:userDefaults];
    if (self) {
        self.registerDefaults = userDefaults;
    }
    return self;
}


#pragma mark - Overwritten in subclass
- (void)setPropertyValue:(id)value forKey:(NSString*)key
{
    if ([value isKindOfClass:NSURL.class]) {
        [NSUserDefaults.standardUserDefaults setURL:value forKey:key];
    } else {
        [NSUserDefaults.standardUserDefaults setObject:value forKey:key];
    }
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (id)getPropertyValueForKey:(NSString*)key
{
    id ret = [NSUserDefaults.standardUserDefaults objectForKey:key];

    if (ret == nil) {
        return [self.registerDefaults valueForKey:key];
    }

    if ([ret isKindOfClass:NSData.class]) {
        @try {
            id ret2 = [NSUserDefaults.standardUserDefaults URLForKey:key];
            if (ret2) {
                ret = ret2;
            }
        }
        @catch (NSException *exception) {
        }
        @finally {
        }
    }
    return ret;
}


@end
