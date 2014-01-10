//
//  LKUserDefaultsTests.m
//  LKUserDefaultsTests
//
//  Created by Hiroshi Hashiguchi on 2014/01/08.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUserDefaults.h"
#import "TestUserDefaults2.h"
#import "TestUserDefaultsSub.h"
#import <CommonCrypto/CommonCrypto.h>

@interface LKUserDefaultsTests : XCTestCase

@end

@implementation LKUserDefaultsTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Utilities
- (NSString*)MD5StringWithData:(NSData*)data
{
    unsigned char md5buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, data.length, md5buffer);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", md5buffer[i]];
    }
    return result;
}



#pragma mark - Test case

- (void)testNumbers
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;
    
    BOOL boolValue = YES;
    defaults.boolValue = boolValue;
    XCTAssertEqual(defaults.boolValue, boolValue, @"");
    XCTAssertEqual(defaults.boolValue, [NSUserDefaults.standardUserDefaults boolForKey:@"boolValue"], @"");

    boolValue = NO;
    defaults.boolValue = boolValue;
    XCTAssertEqual(defaults.boolValue, boolValue, @"");
    XCTAssertEqual(defaults.boolValue, [NSUserDefaults.standardUserDefaults boolForKey:@"boolValue"], @"");

    
    NSInteger integerValue = 2014;
    defaults.integerValue = integerValue;
    XCTAssertEqual(defaults.integerValue, integerValue, @"");
    XCTAssertEqual(defaults.integerValue, [NSUserDefaults.standardUserDefaults integerForKey:@"integerValue"], @"");
    
    float floatValue = 2.014;
    defaults.floatValue = floatValue;
    XCTAssertEqual(defaults.floatValue, floatValue, @"");
    XCTAssertEqual(defaults.floatValue, [NSUserDefaults.standardUserDefaults floatForKey:@"floatValue"], @"");

    double doubleValue = 2.014;
    defaults.doubleValue = doubleValue;
    XCTAssertEqual(defaults.doubleValue, doubleValue, @"");
    XCTAssertEqual(defaults.doubleValue, [NSUserDefaults.standardUserDefaults doubleForKey:@"doubleValue"], @"");
}

- (void)testString
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;

    NSString* stringValue = @"Test string";
    defaults.stringValue = stringValue;
    XCTAssertEqualObjects(defaults.stringValue, stringValue, @"");
    XCTAssertEqualObjects(defaults.stringValue, [NSUserDefaults.standardUserDefaults stringForKey:@"stringValue"], @"");
    
    stringValue = @"Test string #2";
    defaults.stringValue = stringValue;
    XCTAssertEqualObjects(defaults.stringValue, stringValue, @"");
    XCTAssertEqualObjects(defaults.stringValue, [NSUserDefaults.standardUserDefaults stringForKey:@"stringValue"], @"");

}

- (void)testArray
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;

    NSArray* arrayValue = @[@(1), @"string", @(1.2)];
    defaults.arrayValue = arrayValue;
    NSArray* defaultArrayValue = defaults.arrayValue;
    for (int i=0; i < defaultArrayValue.count; i++) {
        XCTAssertEqualObjects(defaultArrayValue[i], arrayValue[i], @"");
    }
    NSArray* standardArrayValue = [NSUserDefaults.standardUserDefaults arrayForKey:@"arrayValue"];
    for (int i=0; i < defaultArrayValue.count; i++) {
        XCTAssertEqualObjects(defaultArrayValue[i], standardArrayValue[i], @"");
    }
}

- (void)testArray2
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;

    NSArray* stringArrayValue = @[@"value1", @"value2", @"value3"];
    defaults.stringArrayValue = stringArrayValue;
    NSArray* defaultStringArrayValue = defaults.stringArrayValue;
    for (int i=0; i < defaultStringArrayValue.count; i++) {
        XCTAssertEqualObjects(defaultStringArrayValue[i], stringArrayValue[i], @"");
    }
    NSArray* standardStringArrayValue = [NSUserDefaults.standardUserDefaults arrayForKey:@"stringArrayValue"];
    for (int i=0; i < defaultStringArrayValue.count; i++) {
        XCTAssertEqualObjects(defaultStringArrayValue[i], standardStringArrayValue[i], @"");
    }
}

- (void)testDictionary
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;

    NSDictionary* dictionaryValue = @{@"key1":@"value1", @"key2":@"value2", @"key3":@"value3"};
    defaults.dictionaryValue = dictionaryValue;
    NSDictionary* defaultDictionaryValue = defaults.dictionaryValue;
    for (id key in defaultDictionaryValue.allKeys) {
        XCTAssertEqualObjects(defaultDictionaryValue[key], dictionaryValue[key], @"");
    }
    NSDictionary* standardDictionaryValue = [NSUserDefaults.standardUserDefaults dictionaryForKey:@"dictionaryValue"];
    for (id key in defaultDictionaryValue.allKeys) {
        XCTAssertEqualObjects(defaultDictionaryValue[key], standardDictionaryValue[key], @"");
    }
}

- (void)testData
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;
    
    NSData* dataValue1 = defaults.randomData;
    NSString* md5String1 = [self MD5StringWithData:dataValue1];
    
    defaults.dataValue = dataValue1;

    NSData* dataValue2 = defaults.dataValue;
    NSString* md5String2 = [self MD5StringWithData:dataValue2];

    NSData* dataValue3 = [NSUserDefaults.standardUserDefaults dataForKey:@"dataValue"];
    NSString* md5String3 = [self MD5StringWithData:dataValue3];

    XCTAssertEqualObjects(md5String2, md5String1, @"");
    XCTAssertEqualObjects(md5String2, md5String3, @"");
}

- (void)testURL
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;
    
    NSURL* urlValue = [NSURL URLWithString:@"http://xcatsan.com/hello?a=1&b=1"];
    defaults.urlValue = urlValue;
    XCTAssertEqualObjects(defaults.urlValue, urlValue, @"");
    XCTAssertEqualObjects(defaults.urlValue, [NSUserDefaults.standardUserDefaults URLForKey:@"urlValue"], @"");

}

- (void)testDate
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;
    
    NSDate* dateValue = NSDate.date;
    defaults.dateValue = dateValue;
    XCTAssertEqualObjects(defaults.dateValue, dateValue, @"");
    XCTAssertEqualObjects(defaults.dateValue, [NSUserDefaults.standardUserDefaults objectForKey:@"dateValue"], @"");
    
    
}

- (void)testRegisterDefaults
{
    TestUserDefaults* defaults = TestUserDefaults.sharedInstance;
    [LKUserDefaults removeUserDefaults];

    XCTAssertEqualObjects(defaults.stringValue, @"Test string", @"");
    XCTAssertEqual(defaults.boolValue, YES, @"");
    XCTAssertEqual(defaults.integerValue, 100, @"");
    XCTAssertEqual(defaults.floatValue, 200.0f, @"");
    XCTAssertEqual(defaults.doubleValue, 300.0, @"");

    NSArray* arrayValue = defaults.arrayValue;
    XCTAssertEqual(arrayValue[0], @(1), @"");
    XCTAssertEqual(arrayValue[1], @(2), @"");
    XCTAssertEqual(arrayValue[2], @(3), @"");

    NSArray* stringArrayValue = defaults.stringArrayValue;
    XCTAssertEqualObjects(stringArrayValue[0], @"A", @"");
    XCTAssertEqualObjects(stringArrayValue[1], @"B", @"");
    XCTAssertEqualObjects(stringArrayValue[2], @"C", @"");

    NSDictionary* dictionaryValue = defaults.dictionaryValue;
    XCTAssertEqualObjects(dictionaryValue[@"KEY1"], @"VALUE1", @"");
    XCTAssertEqualObjects(dictionaryValue[@"KEY2"], @"VALUE2", @"");
    XCTAssertEqualObjects(dictionaryValue[@"KEY3"], @"VALUE3", @"");

    NSString* md5String1 = [self MD5StringWithData:defaults.dataValue];
    NSString* md5String2 = [self MD5StringWithData:defaults.sampleData];
    XCTAssertEqualObjects(md5String1, md5String2, @"");

    NSURL* urlValue = [NSURL URLWithString:@"http://xcatsan.com/hello?a=1&b=1"];
    XCTAssertEqualObjects(defaults.urlValue, urlValue, @"");
    XCTAssertEqualObjects(defaults.dateValue, [NSDate dateWithTimeIntervalSince1970:0], @"");
    
}


- (void)testUserDefaults2
{
    TestUserDefaults2* defaults = TestUserDefaults2.sharedInstance;

    NSString* stringValue = @"Test string";
    defaults.otherString = stringValue;
    XCTAssertEqualObjects(defaults.otherString, stringValue, @"");
    XCTAssertEqualObjects(defaults.otherString, [NSUserDefaults.standardUserDefaults stringForKey:@"otherString"], @"");
    
    stringValue = @"Test string #3";
    defaults.otherString = stringValue;
    XCTAssertEqualObjects(defaults.otherString, stringValue, @"");
    XCTAssertEqualObjects(defaults.otherString, [NSUserDefaults.standardUserDefaults stringForKey:@"otherString"], @"");

}

- (void)testUserDefaultsSub
{
    TestUserDefaultsSub* defaults = TestUserDefaultsSub.sharedInstance;
    
    NSString* stringValue = @"Test string";
    defaults.stringValueSub = stringValue;
    XCTAssertEqualObjects(defaults.stringValueSub, stringValue, @"");
    XCTAssertEqualObjects(defaults.stringValueSub, [NSUserDefaults.standardUserDefaults stringForKey:@"stringValueSub"], @"");
    
    stringValue = @"Test string #4";
    defaults.stringValueSub = stringValue;
    XCTAssertEqualObjects(defaults.stringValueSub, stringValue, @"");
    XCTAssertEqualObjects(defaults.stringValueSub, [NSUserDefaults.standardUserDefaults stringForKey:@"stringValueSub"], @"");
    
}

@end
