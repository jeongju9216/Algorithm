//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/28.
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
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var result: ListNode? = nil
        var tail: ListNode? = nil
        var sum: Int = 0
        
        var inputCursor: ListNode? = head?.next
        while let cur = inputCursor {
            if cur.val == 0 {
                if result == nil {
                    result = ListNode(sum)
                    tail = result
                } else {
                    tail!.next = ListNode(sum)
                    tail = tail!.next
                }
                
                sum = 0
            } else {
                sum += cur.val
            }
            
            inputCursor = cur.next
        }
        
        return result
    }
}
