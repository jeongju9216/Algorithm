//
//  237.swift
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
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let nextNode = node?.next else { return }
        
        node?.val = nextNode.val
        node?.next = nextNode.next
    }
}
