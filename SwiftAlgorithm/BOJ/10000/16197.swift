//
//  16197.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/21.
//

import Foundation

//동전이 나갔는지
func isOut(_ coin: (x: Int, y: Int)) -> Bool {
    return coin.x < 0 || coin.x >= n || coin.y < 0 || coin.y >= m
}

func dfs(_ coin1: (x: Int, y: Int), _ coin2: (x: Int, y: Int), _ count: Int, _ direction: Int) {
    if result < count || count > 10 {
        return
    }
    
    var next1 = (coin1.x + dx[direction], coin1.y + dy[direction])
    var next2 = (coin2.x + dx[direction], coin2.y + dy[direction])
    
    let isOutCoin1 = isOut(next1)
    let isOutCoin2 = isOut(next2)
    
    //둘다 떨어지는 경우
    if isOutCoin1 && isOutCoin2 {
        return
    }
    
    //둘 중 하나 떨어지는 경우
    if isOutCoin1 || isOutCoin2 {
        result = min(result, count)
        return
    }
    
    //벽때문에 못 움직이는 경우
    if map[next1.0][next1.1] == "#" {
        next1 = coin1
    }
    
    if map[next2.0][next2.1] == "#" {
        next2 = coin2
    }
    
    for i in 0..<4 {
        dfs(next1, next2, count + 1, i)
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[String]] = []

var coin1: (x: Int, y: Int) = (-1, -1)
var coin2: (x: Int, y: Int) = (-1, -1)
for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
    
    //동전 위치 저장
    if coin1.x == -1 || coin2.x == -1 {
        for (j, char) in input.enumerated() {
            if char == "o" {
                if coin1.x == -1 && coin1.y == -1 {
                    coin1 = (i, j)
                } else {
                    coin2 = (i, j)
                }
            }
        }
    }
}

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
var result: Int = Int.max
for i in 0..<4 {
    dfs(coin1, coin2, 1, i)
}

if result > 10 {
    result = -1
}

print(result)
