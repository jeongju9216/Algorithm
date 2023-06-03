//
//  1094.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

let x = Int(readLine()!)!

var sticks: [Int] = [64]
while sticks.reduce(0, +) > x {
//    sticks.sort()
    let shortest = sticks.removeLast()
    
    if sticks.reduce(0, +) + shortest / 2 >= x {
        sticks.append(shortest / 2)
    } else {
        sticks.append(shortest / 2)
        sticks.append(shortest / 2)
    }
}

print(sticks.count)
