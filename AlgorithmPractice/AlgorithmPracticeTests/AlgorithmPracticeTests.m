//
//  AlgorithmPracticeTests.m
//  AlgorithmPracticeTests
//
//  Created by zmx on 2020/3/28.
//  Copyright © 2020 ChenFeng. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LinkedList.h"

@interface AlgorithmPracticeTests : XCTestCase

@end

@implementation AlgorithmPracticeTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    LinkedList *linkedList = [[LinkedList alloc]init];
    for (int i = 0; i < 10; i++) {
        Node *node = [[Node alloc]init];
        node.name = @(i).stringValue;
        [linkedList addNode:node forIndex:i];
    }    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
