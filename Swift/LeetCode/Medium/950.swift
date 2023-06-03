//
//  950.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/22.
//

import Foundation

class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        var deck: [Int] = deck.sorted(by: <)
        var dequeue: [Int] = []
        dequeue.append(deck.popLast()!)
        
        while !deck.isEmpty {
            let save: Int = dequeue.popLast()!
            dequeue.insert(save, at: 0)
            dequeue.insert(deck.popLast()!, at: 0)
        }
        
        return dequeue
    }
}
