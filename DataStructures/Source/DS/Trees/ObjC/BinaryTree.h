//
//  BinaryTree.h
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
}TreeNode;

@interface BinaryTree : NSObject

- (instancetype) initWithArray:(NSArray*)array;
- (void) insertKey:(id)key;

- (NSArray*) preorderTraversedItems;
- (NSArray*) inorderTraversedItems;
- (NSArray*) postorderTraversedItems;

@end

extern int* preorderTraversal(struct TreeNode* root, int* returnSize);

NS_ASSUME_NONNULL_END
