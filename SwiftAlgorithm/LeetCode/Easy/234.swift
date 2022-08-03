//
//  234.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/03.
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head?.next != nil else { return true }
        
        let middle = middleNode(head)
        var reverseList = reverseList(middle)
        var list = head
        
        print("list: \(list?.val) / \(list?.next?.val)")
        print("reverseList: \(reverseList?.val) / \(reverseList?.next?.val)")
        
        while list != nil && reverseList != nil {
            if list?.val != reverseList?.val {
                return false
            }
            
            list = list?.next
            reverseList = reverseList?.next
        }
        
        return true
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current: ListNode? = head
        var prev: ListNode? = nil
        
        while current != nil {
            let nextNode = current?.next
            current?.next = prev
            prev = current
            current = nextNode
        }
        
        return prev
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow!.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
