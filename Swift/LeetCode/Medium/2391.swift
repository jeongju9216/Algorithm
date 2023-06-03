//
//  2391.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/05.
//

import Foundation

class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        let costs: [Int] = "MPG".map { getGarbage($0, garbage, travel) }
        return costs.reduce(0, +)
    }
    
    func getGarbage(_ wanted: Character, _ garbages: [String], _ travel: [Int]) -> Int {
        var cost: Int = 0
        var time: Int = 0
        
        for i in 0..<garbages.count {
            let wantedCount: Int = garbages[i].filter { $0 == wanted }.count
            if wantedCount > 0 {
                cost += (time + wantedCount)
                time = 0
            }
            
            if i < travel.count {
                time += travel[i]
            }
        }
        
        return cost
    }
}
