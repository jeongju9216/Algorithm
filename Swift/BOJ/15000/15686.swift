//
//  15686.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/17.
//

import Foundation

//치킨집 좌표를 배열에 넣고
//n개를 뽑아서
//bfs 돌리면서 최소 거리를 찾는다

typealias Point = (x: Int, y: Int)

func chickenDistance(_ chickens: [Point]) -> Int {
    return houses.reduce(0) { sum, house in
        var minDist = Int.max
        for chicken in chickens {
            minDist = min(minDist, abs(house.x - chicken.x) + abs(house.y - chicken.y))
        }
        return sum + minDist
    }
}

func backtracking(_ current: [Point], _ idx: Int) {
    if current.count == m {
        result = min(result, chickenDistance(current))
        return
    }
    
    for i in idx..<chickens.count where !visited[i] {
        visited[i] = true
        backtracking(current + [chickens[i]], i + 1)
        visited[i] = false
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var chickens: [Point] = []
var houses: [Point] = []

for i in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    for j in 0..<n {
        if input[j] == 1 {
            houses.append((i, j))
        } else if input[j] == 2 {
            chickens.append((i, j))
        }
    }
}

var result = Int.max
var visited: [Bool] = Array(repeating: false, count: chickens.count)

backtracking([], 0)

print(result)
