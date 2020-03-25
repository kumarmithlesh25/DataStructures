//
//  QueueTests.m
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArrayQueue.h"
#import "ListQueue.h"

@interface QueueTests : XCTestCase

@end

@implementation QueueTests


- (void)testArrayQueue {
    id<IQueue> arrayQueue = [[ArrayQueue alloc] initWithCapacity:2];

    XCTAssertNil([arrayQueue frontItem]);
    XCTAssertNil([arrayQueue rearItem]);
    XCTAssertNil([arrayQueue dequeue]);

    [arrayQueue enqueue:@10];
    [arrayQueue enqueue:@20];

    XCTAssertFalse([arrayQueue enqueue:@30]);

    XCTAssertEqual([arrayQueue frontItem], @10);
    XCTAssertEqual([arrayQueue rearItem], @20);

    XCTAssertEqual([arrayQueue dequeue], @10);

    XCTAssertEqual([arrayQueue frontItem], @20);
    XCTAssertEqual([arrayQueue rearItem], @20);

    XCTAssertEqual([arrayQueue dequeue], @20);

    XCTAssertNil([arrayQueue frontItem]);
    XCTAssertNil([arrayQueue rearItem]);
}

- (void)testListQueue {
    id<IQueue> arrayQueue = [[ListQueue alloc] initWithCapacity:3];

    XCTAssertNil([arrayQueue frontItem]);
    XCTAssertNil([arrayQueue rearItem]);
    XCTAssertNil([arrayQueue dequeue]);

    [arrayQueue enqueue:@10];
    [arrayQueue enqueue:@20];

    XCTAssertTrue([arrayQueue enqueue:@30]);
    XCTAssertFalse([arrayQueue enqueue:@40]);

    XCTAssertEqual([arrayQueue frontItem], @10);
    XCTAssertEqual([arrayQueue rearItem], @30);

    XCTAssertEqual([arrayQueue dequeue], @10);

    XCTAssertEqual([arrayQueue frontItem], @20);
    XCTAssertEqual([arrayQueue rearItem], @30);

    XCTAssertEqual([arrayQueue dequeue], @20);

    XCTAssertEqual([arrayQueue frontItem], @30);
    XCTAssertEqual([arrayQueue rearItem], @30);

    XCTAssertEqual([arrayQueue dequeue], @30);

    XCTAssertNil([arrayQueue frontItem]);
    XCTAssertNil([arrayQueue rearItem]);
}


@end
