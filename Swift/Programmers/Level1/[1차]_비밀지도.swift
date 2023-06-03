//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in (0..<n) {
        var binary = String(arr1[i] | arr2[i], radix: 2)
        binary = String(repeating: "0", count: n - binary.count) + binary
        
        answer.append(String(binary.map { $0 == "1" ? "#" : " " }))
    }
    
    return answer
}

let n = 5
let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

print(solution(n, arr1, arr2))
