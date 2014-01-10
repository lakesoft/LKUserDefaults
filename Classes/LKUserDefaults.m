//
//  LKUserDefaults.m
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKUserDefaults.h"
#import "LKUserDefaultsProxy.h"

@implementation LKUserDefaults

+ (void)removeUserDefaults
{
    // @see http://stackoverflow.com/questions/545091/clearing-nsuserdefaults
    [NSUserDefaults.standardUserDefaults
     removePersistentDomainForName:NSBundle.mainBundle.bundleIdentifier];
}

#pragma mark - Callback API (Should be overwritten)
+ (id)proxyInstance
{
    LKUserDefaults* defaults = self.new;
    [defaults registerDefaults];
    return [[LKUserDefaultsProxy alloc] initWithUserDefaults:defaults];

}

#pragma mark - Callback API (Should be overwritten)
- (void)registerDefaults
{
    // do nothing
}

@end
