//
//  SampleDefaults.h
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKUserDefaults.h"

@interface SampleDefaults : LKUserDefaults
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSURL* url;
@property (strong, nonatomic) NSDate* date;
@end
