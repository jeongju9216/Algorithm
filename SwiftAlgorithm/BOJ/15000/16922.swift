//
//  16922.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ count: Int, _ start: Int, _ sum: Int) {
    if count == input {
        if !visited[sum] {
            visited[sum] = true
            result += 1
        }
        return
    }
    
    //문자 순서가 달라도 똑같은 숫자이기 때문에 중복 조합을 구하면 됨
    for i in start..<4 {
        backtracking(count + 1, i, sum + nums[i])
    }
}

var nums = [1, 5, 10, 50]
let input = Int(readLine()!)!
var visited: [Bool] = Array(repeating: false, count: 50 * 20 + 1)
var result = 0

backtracking(0, 0, 0)

print(result)
