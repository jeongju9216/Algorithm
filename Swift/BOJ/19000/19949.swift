//
//  19949.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

//연속 세 개는 같지 않게 -> 이전과 똑같으면 변수 + 1 해서 넘기기

func backtracking(_ depth: Int) {
    if depth == 10 {
        var sum = 0
        for i in 0..<10 {
            if input[i] == numbers[i] {
                sum += 1
            }
            
            if sum == 5 {
                result += 1
                return
            }
        }
        return
    }
    
    for i in 1...5 {
        if depth >= 2 {
            if numbers[depth - 1] == i && numbers[depth - 2] == i {
                continue
            }
        }
        
        numbers[depth] = i
        backtracking(depth + 1)
    }
}

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var numbers: [Int] = Array(repeating: 0, count: 10)
var result = 0

backtracking(0)

print(result)
