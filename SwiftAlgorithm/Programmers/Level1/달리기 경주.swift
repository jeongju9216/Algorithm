//
//  달리기 경주.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    
    var rankDict: [String: Int] = [:]
    for i in 0..<players.count {
        rankDict[players[i]] = i
    }
    
    for call in callings {
        let current = rankDict[call]!
        let front = players[current-1]
        
        players.swapAt(current, current-1)
        rankDict[call]! -= 1
        rankDict[front] = current
    }
    
    return players
}
