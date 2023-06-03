//
//  2130.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/18.
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
    func pairSum(_ head: ListNode?) -> Int {
        guard let head = head else {
            return 0
        }
        
        //head부터 링크드 리스트를 순회하면서 값을 집어 넣음
        var nums: [Int] = [head.val]
        
        var cur: ListNode? = head.next
        while cur != nil {
            nums.append(cur!.val)
            cur = cur?.next
        }
                
        var sum: Int = 0
        for i in 0..<(nums.count/2) {
            sum = max(sum, nums[i] + nums[nums.count-1-i])
        }
        
        return sum
    }
}
