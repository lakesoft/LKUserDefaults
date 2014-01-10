//
//  TestUserDefaults.h
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKUserDefaults.h"

@interface TestUserDefaults : LKUserDefaults

@property (strong, nonatomic) NSString* stringValue;

@property (assign, nonatomic) BOOL boolValue;
@property (assign, nonatomic) NSInteger integerValue;
@property (assign, nonatomic) float floatValue;
@property (assign, nonatomic) double doubleValue;

@property (strong, nonatomic) NSArray* arrayValue;
@property (strong, nonatomic) NSArray* stringArrayValue;
@property (strong, nonatomic) NSDictionary* dictionaryValue;
@property (strong, nonatomic) NSData* dataValue;
@property (strong, nonatomic) NSURL* urlValue;
@property (strong, nonatomic) NSDate* dateValue;


- (NSData*)randomData;
- (NSData*)sampleData;

@end
