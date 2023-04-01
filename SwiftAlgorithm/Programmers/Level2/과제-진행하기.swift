//
//  과제-진행하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/01.
//

import Foundation

typealias Item = (name: String, time: Int)

func hourToMin(_ str: String) -> Int {
    let arr = str.split { $0 == ":" }.map { Int(String($0))! }
    return arr[0] * 60 + arr[1]
}

func solution(_ plans: [[String]]) -> [String] {
    
    var result: [String] = []
    
    let plans = plans.sorted { hourToMin($0[1]) < hourToMin($1[1]) }
    
    var dq: [Item] = []
    for i in 0..<plans.count-1 {
        let diff = hourToMin(plans[i+1][1]) - hourToMin(plans[i][1])
        let cost = Int(plans[i][2])!
                
        if diff >= cost {
            result.append(plans[i][0])
            var restTime = diff - cost
            
            while !dq.isEmpty {
                let cost = dq[0].time
                
                if cost <= restTime {
                    result.append(dq[0].name)
                    dq.removeFirst()
                    
                    restTime -= cost
                } else {
                    dq[0].time -= restTime
                    break
                }
            }
        } else {
            let rest = cost - diff
            dq.insert((plans[i][0], rest), at: 0)
        }
    }
    result.append(plans.last![0])
    
    result.append(contentsOf: dq.map { $0.name })
    
    return result
}

print(solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]))
print(solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]]))
