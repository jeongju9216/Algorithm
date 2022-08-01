//
//  21.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/01.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil || list2 == nil {
            return list1 ?? list2
        }
        
        var head: ListNode?
        var tail: ListNode?
        
        var cur1 = list1
        var cur2 = list2
        
        while cur1 != nil && cur2 != nil {
            var cur: ListNode?
            if cur1!.val <= cur2!.val {
                cur = cur1
                cur1 = cur1?.next
            } else {
                cur = cur2
                cur2 = cur2?.next
            }
                        
            if head == nil {
                head = cur
            } else {
                tail?.next = cur
            }
            
            tail = cur
        }
        
        tail?.next = cur1 ?? cur2
        
        return head
    }
}
