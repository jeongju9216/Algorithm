//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/05.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0, totalWeight = 0, truckCount = 0
    var weights: [Int] = Array(repeating: 0, count: bridge_length)
    
    while truckCount < truck_weights.count {
        totalWeight -= weights.removeFirst()
        time += 1
        
        if truck_weights[truckCount] + totalWeight <= weight {
            totalWeight += truck_weights[truckCount]
            weights.append(truck_weights[truckCount])
            
            truckCount += 1
        } else {
            weights.append(0)
        }
    }
    
    return time + bridge_length
}

let bridge_length = 2
let weight = 10
let truck_weights = [7, 4, 5, 6]
print(solution(bridge_length, weight, truck_weights))
