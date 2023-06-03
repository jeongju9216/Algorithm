//
//  328.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return head
        }
        
        //odd와 even 따로 관리
        var oddCur: ListNode? = head, evenCur: ListNode? = head.next
        var oddHead = head, evenHead = evenCur
        
        while oddCur?.next != nil && evenCur?.next != nil {
            oddCur?.next = oddCur?.next?.next
            evenCur?.next = evenCur?.next?.next
            
            oddCur = oddCur?.next
            evenCur = evenCur?.next
        }
        
        oddCur?.next = evenHead
        
        return head
    }
}
