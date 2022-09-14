//
//  2.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/12.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: [Int] = []
        
        var cur1: ListNode? = l1!
        var cur2: ListNode? = l2!
        
        var upper = 0
        while let next1 = cur1, let next2 = cur2 {
            result.append(next1.val + next2.val)
            
            cur1 = next1.next
            cur2 = next2.next
        }
        
        while let next1 = cur1 {
            result.append(next1.val)
            cur1 = next1.next
        }
        
        while let next2 = cur2 {
            result.append(next2.val)
            cur2 = next2.next
        }
        
        print("result: \(result)")

        var cur: ListNode? = ListNode(0)
        var head = cur
        
        let count = result.count
        for i in 0..<count {
            if i+1 < count && result[i] > 9 {
                result[i] -= 10
                result[i+1] += 1
            }
            
            cur?.next = ListNode(result[i])
            cur = cur?.next
        }
        
        if let num = cur?.val, num > 9 {
            cur?.val -= 10
            cur?.next = ListNode(1)
        }
        
        return head?.next
    }
}
