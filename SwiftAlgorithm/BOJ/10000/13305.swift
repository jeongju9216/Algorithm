//
//  13305.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//현재 가격이랑 지금까지의 최저 가격이랑 비교

let n = Int(readLine()!)!
let dists = readLine()!.components(separatedBy: " ").map { Int($0)! }
let costs = readLine()!.components(separatedBy: " ").map { Int($0)! }

var minCost = costs[0]
var result = 0
for i in 0..<dists.count {
    result += (minCost * dists[i])
    minCost = min(minCost, costs[i+1])
}

print(result)
