//
//  141.swift
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
    func hasCycle(_ head: ListNode?) -> Bool {
        let maxValue = 100001
        
        var cur: ListNode? = head
        cur?.val = maxValue
        
        while let node = cur?.next {
            if node.val == maxValue {
                return true
            }
            
            node.val = maxValue
            cur = node.next
        }
        
        return false
    }
}
