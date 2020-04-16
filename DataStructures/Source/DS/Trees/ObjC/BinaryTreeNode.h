//
//  BinaryTreeNode.h
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTreeNode : NSObject

@property (nonatomic, strong) id key;
@property (nonatomic, strong) BinaryTreeNode * _Nullable left;
@property (nonatomic, strong) BinaryTreeNode * _Nullable right;

@end

NS_ASSUME_NONNULL_END
