//
//  160.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/02.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var curA = headA
        var curB = headB
        
        while curA !== curB {
            curA = (curA == nil) ? headB : curA?.next
            curB = (curB == nil) ? headA : curB?.next
        }
        
        return curA
    }
}
