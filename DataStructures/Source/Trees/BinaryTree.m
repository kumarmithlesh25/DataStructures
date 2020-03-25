//
//  BinaryTree.m
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/2/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"
#import "ListQueue.h"
#import "BinaryTreeNode.h"


int* preorderTraversal(struct TreeNode* root, int* returnSize) {
    if (root == NULL) {
        return NULL;
    }

    int *arr = (int*)malloc(sizeof(int));
    arr[0] = root->val;
    *returnSize += 1;


    int leftCount = 0;
    int *left = preorderTraversal(root->left, &leftCount);

    int rightCount = 0;
    int *right = preorderTraversal(root->right, &rightCount);

    if (leftCount > 0 || rightCount > 0) {
        int * newArr = (int*)realloc(arr, sizeof(int) * (*returnSize+leftCount+rightCount));
        int index = 0;

        if (leftCount > 0 && left != NULL) {
            for (int i = 0; i < leftCount; ++i) {
                index++;
                newArr[index] = left[i];
            }
            free(left);
        }

        if (rightCount > 0 && right != NULL) {
            for (int i = 0; i < rightCount; ++i) {
                index++;
                newArr[index] = right[i];
            }
            free(right);
        }
        arr = newArr;
        *returnSize += leftCount + rightCount;
    }


    return arr;
}

@interface BinaryTree() {
    BinaryTreeNode * _Nullable root_;
    ListQueue *queue_; // Used to add new key at leaf
}

@end

@implementation BinaryTree

- (void) _initializeWithArray:(NSArray*)array{
    for (id value in array) {
        [self insertKey:value];
    }
}

- (instancetype) init {
    self = [super init];

    if (self) {
        queue_ = [[ListQueue alloc] initWithCapacity:UINT_MAX];
    }

    return  self;
}

- (instancetype) initWithArray:(NSArray*)array {
    self = [self init];

    if (self)  {
        [self _initializeWithArray:array];
    }

    return self;
}

- (BOOL) isValidRoot {
    return ![root_ isKindOfClass:[NSNull class]];
}

// node can be NSNull or BinaryTreeNode
- (void) _insertNode:(id _Nonnull)node {

    if (![self isValidRoot]){
        // Can't add new nodes to the tree as root node is not valid.
        return;
    }

    if (root_ != nil) {
        // Get the front node in the queue
        id frontNode = (BinaryTreeNode*)[queue_ frontItem];

        if ([frontNode respondsToSelector:@selector(left)] && [frontNode left] == nil) {
            [frontNode setLeft:node];
        } else if ([frontNode respondsToSelector:@selector(right)] && [frontNode right] == nil) {
            [frontNode setRight:node];
        } else {
            [queue_ dequeue];
            id frontNode = (BinaryTreeNode*)[queue_ frontItem];
            if ([frontNode respondsToSelector:@selector(left)] && [frontNode left] == nil) {
                [frontNode setLeft:node];
            }
        }
    } else {
        root_ = node;
    }

    if (![node isKindOfClass:[NSNull class]]) {
        [queue_ enqueue:node];
    }
}

- (void) insertKey:(id)key {

    if ([key isKindOfClass:[NSNull class]]) {
        [self _insertNode:key];
    } else {
        BinaryTreeNode *node = [[BinaryTreeNode alloc] init];
        node.key = key;
        [self _insertNode:node];
    }
}

- (NSArray*) _recursivelyTraversePreorder:(BinaryTreeNode*)rootNode {
    NSMutableArray *mArr = [NSMutableArray new];

    if ([rootNode isKindOfClass:[NSNull class]] || rootNode == nil) {
        return mArr.copy;
    }

    [mArr addObject:rootNode.key];
    [mArr addObjectsFromArray:[self _recursivelyTraversePreorder:rootNode.left]];
    [mArr addObjectsFromArray:[self _recursivelyTraversePreorder:rootNode.right]];

    return mArr.copy;
}

- (NSArray*) _recursivelyTraverseInorder:(BinaryTreeNode*)rootNode {
    NSMutableArray *mArr = [NSMutableArray new];

    if ([rootNode isKindOfClass:[NSNull class]] || rootNode == nil) {
        return mArr.copy;
    }

    [mArr addObjectsFromArray:[self _recursivelyTraverseInorder:rootNode.left]];
    [mArr addObject:rootNode.key];
    [mArr addObjectsFromArray:[self _recursivelyTraverseInorder:rootNode.right]];

    return mArr.copy;
}

- (NSArray*) _recursivelyTraversePostorder:(BinaryTreeNode*)rootNode {
    NSMutableArray *mArr = [NSMutableArray new];

    if ([rootNode isKindOfClass:[NSNull class]] || rootNode == nil) {
        return mArr.copy;
    }

    [mArr addObjectsFromArray:[self _recursivelyTraversePostorder:rootNode.left]];
    [mArr addObjectsFromArray:[self _recursivelyTraversePostorder:rootNode.right]];
    [mArr addObject:rootNode.key];

    return mArr.copy;
}

- (NSArray*) preorderTraversedItems {
    return [self _recursivelyTraversePreorder:root_];
}

- (NSArray*) inorderTraversedItems {
    return [self _recursivelyTraverseInorder:root_];
}

- (NSArray*) postorderTraversedItems {
    return [self _recursivelyTraversePostorder:root_];
}

@end
