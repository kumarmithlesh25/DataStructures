//
//  ListQueue.m
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import "ListQueue.h"

@implementation QueueNode

@end

@interface ListQueue() {
    QueueNode *front_;
    QueueNode *rear_;
    NSUInteger size_;
    NSUInteger capacity_;
}

@end

@implementation ListQueue

- (instancetype) initWithCapacity:(NSUInteger)capacity {
    self = [super init];

    if (self) {
        capacity_ = capacity;
        size_ = 0;
    }

    return self;
}

- (BOOL) isEmpty_ {
    return front_ == nil;
}

- (BOOL) isFull_ {
    return size_ == capacity_;
}

#pragma mark - IQueue

// Returns NO if key can't be added due to full queue
- (BOOL) enqueue:(id)key {
    if ([self isFull_]) {
        return NO;
    }

    QueueNode *node = [[QueueNode alloc] init];
    node.value = key;
    node.next = nil;
    size_ += 1;

    if (rear_ != nil) {
        rear_.next = node;
    } else {
        front_ = node;
    }
    rear_ = node;

    return YES;
}

- (_Nullable id) dequeue {
    id key = [self frontItem];
    if (key != nil) {
        front_ = front_.next;
        size_ -= 1;
    }
    return key;
}

- (_Nullable id) frontItem {
    if ([self isEmpty_]) {
        return nil;
    }

    return front_.value;
}

- (_Nullable id) rearItem {
    if ([self isEmpty_]) {
        return nil;
    }

    return rear_.value;
}

@end
