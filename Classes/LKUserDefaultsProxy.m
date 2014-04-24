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
@property (weak, nonatomic) LKUserDefaults* userDefaults;
@end

@implementation LKUserDefaultsProxy


#pragma mark - API
- (id)initWithUserDefaults:(LKUserDefaults*)userDefaults
{
    self = [super initWithTarget:userDefaults];
    if (self) {
        self.userDefaults = userDefaults;
    }
    return self;
}


#pragma mark - Overwritten in subclass
- (void)setPropertyValue:(id)value forKey:(NSString*)key
{
    NSString *storeKey = [self storeKeyForKey:key];

    if ([value isKindOfClass:NSURL.class]) {
        [NSUserDefaults.standardUserDefaults setURL:value forKey:storeKey];
    } else {
        [NSUserDefaults.standardUserDefaults setObject:value forKey:storeKey];
    }
    [NSUserDefaults.standardUserDefaults synchronize];
}

- (id)getPropertyValueForKey:(NSString*)key
{
    NSString* className = [self classNameForKey:key];
    NSString *storeKey = [self storeKeyForKey:key];

    id ret = nil;

    if ([className isEqualToString:@"NSURL"]) {
        ret = [NSUserDefaults.standardUserDefaults URLForKey:storeKey];
    } else {
        ret = [NSUserDefaults.standardUserDefaults objectForKey:storeKey];
    }
    if (ret == nil) {
        ret = [self.userDefaults valueForKey:key];
    }

    return ret;
}

- (NSString *)storeKeyForKey:(NSString *)key {

    if (self.userDefaults.storeKeyMaps && self.userDefaults.storeKeyMaps[key]) {
        key = self.userDefaults.storeKeyMaps[key];
    }

    if (self.userDefaults.storeKeyPrefix) {
        key = [NSString stringWithFormat:@"%@%@", self.userDefaults.storeKeyPrefix, key];
    }

    return key;
}

@end
