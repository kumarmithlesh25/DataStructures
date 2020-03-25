//
//  ArrayQueue.m
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import "ArrayQueue.h"

@interface ArrayQueue() {
    NSUInteger capacity_;
    NSMutableArray *storage_;
}

@end

@implementation ArrayQueue

- (instancetype) initWithCapacity:(NSUInteger)capacity {
    self = [super init];

    if (self) {
        capacity_ = capacity;
        storage_ = [[NSMutableArray alloc] initWithCapacity:capacity];
    }

    return self;
}

- (BOOL) isEmpty_ {
    return storage_.count == 0;
}

- (BOOL) isFull_ {
    return storage_.count == capacity_;
}

#pragma mark - IQueue

// Returns NO if key can't be added due to full queue
- (BOOL) enqueue:(id)key {
    if ([self isFull_]) {
        return NO;
    }

    [storage_ addObject:key];
    return YES;
}

- (_Nullable id) dequeue {
    if ([self isEmpty_]) {
        return nil;
    }
    
    id key = [storage_ objectAtIndex:0];
    [storage_ removeObjectAtIndex:0];
    return key;
}

- (_Nullable id) frontItem {
    if ([self isEmpty_]) {
        return nil;
    }

    return [storage_ objectAtIndex:0];
}

- (_Nullable id) rearItem {
    if ([self isEmpty_]) {
        return nil;
    }

    return [storage_ lastObject];
}

@end
