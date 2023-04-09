//
//  15686.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/09.
//

import Foundation

typealias Point = (x: Int, y: Int)

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
var houses: [Point] = []
var chickens: [Point] = []
for i in 0..<n {
    map.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
    for j in 0..<n {
        if map[i][j] == 1 {
            houses.append((i, j))
        } else if map[i][j] == 2 {
            chickens.append((i, j))
        }
    }
}


//치킨집 폐업 여부
var visited: [Bool] = Array(repeating: false, count: chickens.count)

func calDistance() -> Int {
    var sum = 0
    
    for house in houses {
        var d = Int.max
        
        //house에서 가장 가까운 치킨집을 구함
        for j in 0..<chickens.count {
            guard visited[j] else { continue }
            
            let d2 = abs(house.x - chickens[j].x) + abs(house.y - chickens[j].y)
            
            d = min(d, d2)
        }
        sum += d
    }
    
    return sum
}

func selectChicken(_ index: Int, _ count: Int) {
    if count == m {
        //m개를 폐업했을 때 거리 계산
        result = min(result, calDistance())
        return
    }
    
    //폐업시킬 m개 선택
    for i in index..<chickens.count {
        if !visited[i] {
            visited[i] = true
            
            selectChicken(i, count + 1)
            
            visited[i] = false
        }
    }
}

var result = Int.max

selectChicken(0, 0)
print(result)
