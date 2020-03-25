//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/3/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public enum TraversalMethod {
    case recursive
    case iterative
}

public class BinaryTreeNode {
    public var key: Any
    public var left: Any? // left and right can be BinaryTreeNode or NSNull
    public var right: Any?

    public init(key: Any) {
        //return self
        self.key = key
    }
}

public class BinaryTree {
    var root: BinaryTreeNode?
    var queue: ListQueue

    public init(keys: [Any]) {
        self.queue = ListQueue(capacity: UInt(UINT32_MAX))
        initializeWithKeys(keys)
    }

    public init(key: Any) {
        self.queue = ListQueue(capacity: UInt(UINT32_MAX))
        insertKey(key)
    }

    private func initializeWithKeys(_ keys: [Any]) {
        for key in keys {
            insertKey(key);
        }
    }

    private func insertTreeNode(_ node: Any) {
        guard root != nil else {
            root = node as? BinaryTreeNode

            if node is NSNull == false {
                queue.enqueue(node)
            }
            return
        }

        guard let top = queue.frontItem() as? BinaryTreeNode else {
            return
        }

        if top.left == nil {
            top.left = node
        } else if top.right == nil {
            top.right = node
        } else {
            queue.dequeue()
            // Get the top of the queue and if it's not NSNull, add left child as this node
            guard let top = queue.frontItem() as? BinaryTreeNode else {
                print("Could not add \(node) as leaf node couldn't be extracted")
                return
            }
            top.left = node
        }

        if node is NSNull == false {
            queue.enqueue(node)
        }

    }

    private func preorderTraversalWithRootNodeRecursively(_ root: Any?) -> [Any] {
        guard let root = root as? BinaryTreeNode else {
            return []
        }

        var results: [Any] = []
        results.append(root.key)

        results.append(contentsOf: preorderTraversalWithRootNodeRecursively(root.left))
        results.append(contentsOf: preorderTraversalWithRootNodeRecursively(root.right))

        return results
    }

    private func inorderTraversalWithRootNodeRecursively(_ root: Any?) -> [Any] {
        guard let root = root as? BinaryTreeNode else {
            return []
        }

        var results: [Any] = []
        results.append(contentsOf: inorderTraversalWithRootNodeRecursively(root.left))
        results.append(root.key)
        results.append(contentsOf: inorderTraversalWithRootNodeRecursively(root.right))

        return results
    }

    private func postorderTraversalWithRootNodeRecursively(_ root: Any?) -> [Any] {
        guard let root = root as? BinaryTreeNode else {
            return []
        }

        var results: [Any] = []
        results.append(contentsOf: postorderTraversalWithRootNodeRecursively(root.left))
        results.append(contentsOf: postorderTraversalWithRootNodeRecursively(root.right))
        results.append(root.key)

        return results

    }

    private func preorderTraversalWithRootNodeIteratively(_ rootNode: BinaryTreeNode?) -> [Any] {
        guard let root = root else {
            return []
        }

        var stack: [Any] = [root]
        var results: [Any] = []

        while !stack.isEmpty {
            guard let top = stack.remove(at: 0) as? BinaryTreeNode else {
                continue
            }

            // visit top
            results.append(top.key)

            // push top item's left and right
            if let right = top.right {
                stack.insert(right, at: 0)
            }

            if let left = top.left {
                stack.insert(left, at: 0)
            }
        }

        return results
    }

    private func inorderTraversalWithRootNodeIteratively(_ rootNode: BinaryTreeNode?) -> [Any] {
        guard let rootNode = rootNode else { return [] }

        var stack = [rootNode]
        var results: [Any] = []

        while (!stack.isEmpty) {
            let top = stack[0]
            let right = top.right as? BinaryTreeNode
            let left = top.left  as? BinaryTreeNode

            guard right != nil || left != nil else {
                results.append(stack.remove(at: 0))
                continue
            }

            if let right = right  {
                if (stack.count == 1) {
                    stack.append(right)
                } else {
                    stack.insert(right, at: 1)
                }
            }

            if let left = left {
                stack.insert(left, at: 0)
            } else {
                results.append(top)
                stack.remove(at: 0)
                results.append(stack.remove(at: 0))
            }
        }

        return results
        
    }

    private func preorderTraversalWithRootNodeMorisTraversal(_ root: Any?) -> [Any] {
        /**
         Start
         1) See left child of a node, if it's found, go to left child. Node = A, Predecessor = LA
            1.1 Go right till right child is nil or current node, A
                1.1.1 When you get a node whose right child is nil, visit the start node (A) and set the last node's (predecessor) right to visited node A
                1.1.2 Set new node as visited node's left child, say B.
         2 Repeat step 1, see left child of node B which is C. Here node = B, Predecessor = C
            2.1 Go right till we find nil or node itself (B). C->right = nil
                2.1.1 Visit the node B and set the predecessor's right to the node. C->right = B
                2.1.2 set new node as node's left child, node = B->right = C
         3) Check left child of the node C, C->left = nil
            3.1 As the left child is nil, visit the node C and set the new node as C->right = B (2.1.1)
            3.2 Node = B, is the left nil, No, go B-> left = C, predecessor = C
            3.3 Go right of predecessor till nil or node is found, c->right = B = Node
                3.3.1 Delete C->right = B
                3.3.2 Go to Node's right child - B->right = D
         4 Is the left of D nil, YES
            4.1 visit D
            4.2 set new node = D->right = A
         5 see left child of node, A->left = B
            5.1 node = A, Pre = B, traverse right till right child is nil or node
            5.2 found D->right = A (node)
                5.2.1 delete D->right = A
                5.2.2 new node = node->right = E
         6 E-> left = nil
            6.1 visit E
            6.2 node = E->right = nil

         end

         let node = root
         let predecessor = nil

         while (node != nil) {
             if node.left != nil {
                predecessor = getPredecessorInRightSubtreeOfLeftChild

                 if predecessor.right == nil {
                    visitNode(node)
                    predecessor.right = node
                } else if predecessor.right == node {
                    predecessor.right = nil
                    node = node.right
                }
                node = node.left
             } else if node.right != nil {
                visitNode(node)

             } else {
                visitNode(node)
             }
         }
         */
        return[]
    }

    public func insertKey(_ key: Any) {
        if key is NSNull {
            if root != nil {
                insertTreeNode(key)
            }
        } else {
            let node = BinaryTreeNode(key: key)
            insertTreeNode(node);
        }
    }

    public func preorderTraversal(method: TraversalMethod = .recursive) -> [Any] {
        switch method {
        case .recursive:
            return preorderTraversalWithRootNodeRecursively(root)
        case .iterative:
            return preorderTraversalWithRootNodeIteratively(root)
        }
    }

    public func inorderTraversal(method: TraversalMethod = .recursive) -> [Any] {
        switch method {
        case .recursive:
            return inorderTraversalWithRootNodeRecursively(root);
        case .iterative:
            return []
        }
    }

    public func postorderTraversal(method: TraversalMethod = .recursive) -> [Any] {
        switch method {
        case .recursive:
            return postorderTraversalWithRootNodeRecursively(root);
        case .iterative:
            return []
        }
    }
}
