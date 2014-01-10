//
//  ViewController.m
//  LKUserDefaults
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "ViewController.h"
#import "SampleDefaults.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SampleDefaults.sharedInstance.name = @"ABC";
    NSLog(@"%@", SampleDefaults.sharedInstance.name);
    NSLog(@"%@", [NSUserDefaults.standardUserDefaults objectForKey:@"name"]);
    
    SampleDefaults.sharedInstance.url = [NSURL URLWithString:@"http://www.www.com/hello?a=1&b=1"];
    NSLog(@"%@", SampleDefaults.sharedInstance.url.class);

    SampleDefaults.sharedInstance.date = NSDate.date;
    NSLog(@"%@", SampleDefaults.sharedInstance.date);

    /*
     2014-01-09 23:11:41.431 LKUserDefaults[5730:70b] ABC
     2014-01-09 23:11:41.433 LKUserDefaults[5730:70b] ABC
     2014-01-09 23:11:41.435 LKUserDefaults[5730:70b] NSURL
     2014-01-09 23:11:41.437 LKUserDefaults[5730:70b] 2014-01-09 14:11:41 +0000
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
