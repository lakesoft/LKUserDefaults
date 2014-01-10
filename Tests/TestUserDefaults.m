//
//  TestUserDefaults.m
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "TestUserDefaults.h"

@implementation TestUserDefaults


- (NSData*)randomData
{
    unsigned char bytes[1024];
    for (int i=0; i < 1024; i++) {
        bytes[i] = arc4random_uniform(256);
    }
    return [NSData dataWithBytes:bytes length:1024];
}

- (NSData*)sampleData
{
    unsigned char bytes[1024];
    for (int i=0; i < 1024; i++) {
        bytes[i] = 99;
    }
    return [NSData dataWithBytes:bytes length:1024];
}

- (void)registerDefaults
{
    self.stringValue = @"Test string";
    self.boolValue = YES;
    self.integerValue = 100;
    self.floatValue = 200.0;
    self.doubleValue = 300.0;
    self.arrayValue= @[@(1), @(2), @(3)];
    self.stringArrayValue = @[@"A", @"B", @"C"];
    self.dictionaryValue = @{@"KEY1":@"VALUE1", @"KEY2":@"VALUE2", @"KEY3":@"VALUE3"};
    self.dataValue = [self sampleData];
    self.urlValue = [NSURL URLWithString:@"http://xcatsan.com/hello?a=1&b=1"];
    self.dateValue = [NSDate dateWithTimeIntervalSince1970:0];
}

@end
