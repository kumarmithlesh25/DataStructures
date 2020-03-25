//
//  LinkedList.swift
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 3/26/20.
//  Copyright © 2020 Mithlesh Kumar Jha. All rights reserved.
//

import Foundation

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


class LinkedListProblems {
    
    static func reorderList(_ head: ListNode?) {
        // Find the middle node
        guard let middle = middleNode(head: head) else { return }

        // split the node into two halves
        var head2 = middle.next;

        // Set the last node of first half to point to nil
        middle.next = nil

        // Reverse the second half
        head2 = reverse(head: head2)

        // combine the two lists
        combine(head1: head, head2: head2)
    }

    static  func combine(head1: ListNode?, head2: ListNode?) {
        var h1 = head1
        var h2 = head2
        var temp1: ListNode?
        var temp2: ListNode?
        while h1 != nil, h2 != nil {
            temp1 = h1?.next
            temp2 = h2?.next
            h1?.next = h2
            h1 = temp1

            if h1 != nil {
                h2?.next = h1
                h2 = temp2
            }
        }
    }

    static  func reverse(head: ListNode?) -> ListNode? {
        var previous: ListNode?
        var current = head
        var temp: ListNode?

        while current !== nil {
            temp = current?.next
            current?.next = previous
            previous = current
            current = temp
        }

        return previous;
    }

    static func middleNode(head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
    // We'll use two pointers - a slow pointer that increments 1 step and a fast pointers that increment twice
    // To find the middle node, we increment both the pointers and when the fast pointer reaches the far end, the slow pointer points to the middle node
        var slow: ListNode? = head
        var fast: ListNode? = head?.next

        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }

    static func mergeTwoSortedLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node: ListNode? = dummy
        var h1 = l1
        var h2 = l2

        // Traverse until we arrive at end of one of the lists
        while h1 != nil, h2 != nil {
            if h1!.val <= h2!.val {
                node?.next = h1
                h1 = h1?.next
            } else {
                node?.next = h2
                h2 = h2?.next
            }
            node = node?.next
        }

        if h1 != nil {
            node?.next = h1
        } else if h2 != nil {
            node?.next = h2
        }

        return dummy.next
    }
}
