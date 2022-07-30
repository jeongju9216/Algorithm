//
//  206.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/30.
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        var next = head?.next
        
        node?.next = nil
        
        while next != nil {
            let temp = next?.next
            next?.next = node
            
            node = next
            next = temp
        }
        
        return node
    }
}
