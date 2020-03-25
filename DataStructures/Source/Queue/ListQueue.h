//
//  ListQueue.h
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

NS_ASSUME_NONNULL_BEGIN

@interface QueueNode: NSObject

@property (nonatomic, strong) id value;
@property (nonatomic, strong)  QueueNode *_Nullable next;

@end

@interface ListQueue : NSObject <IQueue>

- (instancetype) initWithCapacity:(NSUInteger)capacity;

@end

NS_ASSUME_NONNULL_END
