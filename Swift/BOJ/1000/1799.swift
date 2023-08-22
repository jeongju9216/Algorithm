//
//  1799.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/22.
//

import Foundation

typealias Point = (x: Int, y: Int)

func bishop(_ th: Int, _ cnt: Int) {
    if th >= 2 * n - 1 {
        result = max(result, cnt)
        return
    }
    
    var flag = false //th번 째 대각선에서 비숍을 놓을 수 있는지 없는지
    for i in 0..<n-abs(th - (n - 1)) {
        let x = n - 1 <= th ? n - 1 - i : th - i
        let y = n - 1 <= th ? th - (n - 1) + i : i
        
        let rightIndex = th
        let leftIndex = n - 1 + (x - y)
        if map[x][y] == 1 && !right[rightIndex] && !left[leftIndex] {
            flag = true
            right[rightIndex] = true //우상향 대각선에 비숍을 놓음
            left[leftIndex] = true //좌상향 대각선에 비숍을 놓음
            bishop(th + 1, cnt + 1)
            right[rightIndex] = false //우상향 대각선 놓은 비숍 제거
            left[leftIndex] = false //좌상향 대각선 놓은 비숍 제거
        }
    }
    
    //th 번째 대각선에 안 놓는 경우
    if !flag {
        bishop(th + 1, cnt)
    }
}

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}


var right: [Bool] = Array(repeating: false, count: 2 * n) //우상향
var left: [Bool] = Array(repeating: false, count: 2 * n) //좌상향
var result = 0

bishop(0, 0)

print(result)
