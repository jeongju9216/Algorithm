//
//  광물-캐기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

let costs: [[Int]] = [[1, 1, 1], [5, 1, 1], [25, 5, 1]]
var result = 0

func dfs(_ index: Int, _ cost: Int, _ picks: [Int], _ minerals: [Int]) {
    
    //모든 광물 다 캠 || 모든 곡괭이 다 씀
    if index >= minerals.count || picks.reduce(0, +) == 0 {
        result = min(result, cost)
        return
    }
    
    var diaPick = 0, iPick = 0, sPick = 0
    for i in index..<min(index + 5, minerals.count) {
        diaPick += costs[0][minerals[i]]
        iPick += costs[1][minerals[i]]
        sPick += costs[2][minerals[i]]
    }
    
    if picks[0] > 0 {
        var picks = picks
        picks[0] -= 1
        dfs(index + 5, cost + diaPick, picks, minerals)
    }
    
    if picks[1] > 0 {
        var picks = picks
        picks[1] -= 1
        dfs(index + 5, cost + iPick, picks, minerals)
    }
    
    if picks[2] > 0 {
        var picks = picks
        picks[2] -= 1
        dfs(index + 5, cost + sPick, picks, minerals)
    }
}

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    let minerals: [Int] = minerals.map {
        var t = -1
        switch $0 {
            case "diamond": t = 0
            case "iron": t = 1
            case "stone": t = 2
            default: break
        }
        return t
    }
    
    print("minerals: \(minerals)")
    
    dfs(0, 0, picks, minerals)
    
    return result
}

print(solution([1, 3, 2], ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]))
