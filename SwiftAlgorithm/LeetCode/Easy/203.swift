//
//  203.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else { return head }
        
        var cur: ListNode? = ListNode(0, head)
        var newHead = cur
        while let next = cur?.next {
            if next.val == val {
                cur?.next = next.next
            } else {
                cur = next
            }
            
        }
        
        return newHead?.next
    }
}
