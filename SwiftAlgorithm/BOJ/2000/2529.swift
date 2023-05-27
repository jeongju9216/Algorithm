//
//  2529.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

//부등호를 보고 이전 숫자와 비교했을 때 조건에 맞는 숫자 넣고 백트래킹
//Int로 변환해서 정렬해서 첫 번째랑 마지막꺼 String 출력

func backtracking(_ current: [Int], _ depth: Int) {
    if current.count == k + 1 {
        let str = current.map { String($0) }.joined()
        maxResult = max(maxResult, str)
        minResult = minResult.isEmpty ? str : min(minResult, str)
        return
    }
    
    for i in 0...9 where !visited[i] {
        if input[depth] == "<" && current[depth] < i {
            visited[i] = true
            backtracking(current + [i], depth + 1)
            visited[i] = false
        } else if input[depth] == ">" && current[depth] > i {
            visited[i] = true
            backtracking(current + [i], depth + 1)
            visited[i] = false
        }
    }
}

let k = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { String($0) }

var visited: [Bool] = Array(repeating: false, count: 10)

var maxResult = "", minResult = ""
for i in 0...9 {
    visited[i] = true
    backtracking([i], 0)
    visited[i] = false
}

print(maxResult)
print(minResult)
