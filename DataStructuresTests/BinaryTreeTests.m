//
//  BinaryTreeTests.m
//  DataStructuresTests
//
//  Created by Mithlesh Kumar Jha on 2/3/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinaryTree.h"

@interface BinaryTreeTests : XCTestCase

@end

@implementation BinaryTreeTests

- (void) testEmptyOrInvalidTree {
    BinaryTree *tree = [[BinaryTree alloc] initWithArray:@[[NSNull null]] ];
    [tree insertKey:@5];
    XCTAssertTrue([tree preorderTraversedItems].count == 0);

    BinaryTree *tree2 = [[BinaryTree alloc] initWithArray:@[]];
    XCTAssertTrue([tree2 preorderTraversedItems].count == 0);
}

- (void)testRandom {
    NSArray *arr = @[@37, @34, @100, [NSNull null], @-100];
    BinaryTree *tree = [[BinaryTree alloc] initWithArray:arr];
    NSArray *preorderArray = [tree preorderTraversedItems];
    NSArray *expectedArray = @[@37, @34, @-100, @100];
    XCTAssertEqualObjects(preorderArray, expectedArray);
}

- (void) testLarge {
    NSArray *arr = @[@37,@-34,@-48,[NSNull null],@-100,@-100,@48,[NSNull null],[NSNull null],[NSNull null],[NSNull null],@-54,[NSNull null],@-71,@-22,[NSNull null],[NSNull null],[NSNull null],@8];
    BinaryTree *tree = [[BinaryTree alloc] initWithArray:arr];
    NSArray *preorderArray = [tree preorderTraversedItems];
    NSArray *expectedArray = @[@37,@-34,@-100,@-48,@-100,@48,@-54,@-71,@-22,@8];
    XCTAssertEqualObjects(preorderArray, expectedArray);

    NSArray *inorderArray = [tree inorderTraversedItems];
    NSArray *expectedInorderArray = @[@-34,@-100,@37,@-100,@-48,@-71,@-54,@-22,@8,@48];
    XCTAssertEqualObjects(inorderArray, expectedInorderArray);

    NSArray *postorderArray = [tree postorderTraversedItems];
    NSArray *expectedPostorderArray = @[@-100,@-34,@-100,@-71,@8,@-22,@-54,@48,@-48,@37];
    XCTAssertEqualObjects(postorderArray, expectedPostorderArray);
}

- (TreeNode*) nodeWithValue:(int)val left:(TreeNode*)left right:(TreeNode*)right {
    TreeNode *root = (TreeNode*)malloc(sizeof(TreeNode));
    root -> val = val;
    root -> left = left;
    root -> right = right;
    return root;
}

- (void) testCFunc {

    TreeNode *node4 = [self nodeWithValue:-100 left:nil right:nil];
    TreeNode *node2 = [self nodeWithValue:-34 left:nil right:node4];

    TreeNode *node5 = [self nodeWithValue:-100 left:nil right:nil];
    TreeNode *node8 = [self nodeWithValue:-71 left:nil right:nil];
    TreeNode *node10 = [self nodeWithValue:8 left:nil right:nil];
    TreeNode *node9 = [self nodeWithValue:-22 left:nil right:node10];
    TreeNode *node7 = [self nodeWithValue:-54 left:node8 right:node9];
    TreeNode *node6 = [self nodeWithValue:48 left:nil right:node7];
    TreeNode *node3 = [self nodeWithValue:-48 left:node5 right:node6];
    TreeNode *root = [self nodeWithValue:37 left:node2 right:node3];

    int size = 0;
    preorderTraversal(root, &size);
    XCTAssert(size == 10);
    
}




@end
