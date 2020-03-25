//
//  Queue.h
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#ifndef Queue_h
#define Queue_h

@protocol IQueue <NSObject>

// Returns NO if key can't be added due to full queue
- (BOOL) enqueue:(id _Nonnull)key;

- (_Nullable id) dequeue;

- (_Nullable id) frontItem;

- (_Nullable id) rearItem;

@end

#endif /* Queue_h */
