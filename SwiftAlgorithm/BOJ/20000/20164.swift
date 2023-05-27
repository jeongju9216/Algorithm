//
//  20164.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

func solution(_ input: String, _ currentCount: Int) {
    let arr = Array(input)
    let oddCount = arr.filter { Int(String($0))! % 2 != 0 }.count

    let nextCount = currentCount + oddCount
    guard arr.count > 1 else {
        minResult = min(minResult, nextCount)
        maxResult = max(maxResult, nextCount)
        return
    }
    
    if arr.count == 2 {
        let sum = Int(String(arr[0]))! + Int(String(arr[1]))!
        solution(String(sum), nextCount)
    } else {
        for i in 1..<arr.count-1 {
            for j in i+1..<arr.count {
                let num1 = Int(String(arr[0..<i]))!
                let num2 = Int(String(arr[i..<j]))!
                let num3 = Int(String(arr[j..<arr.count]))!
                
                let sum = num1 + num2 + num3
                solution(String(sum), nextCount)
            }
        }
    }
}

let n = readLine()!

var minResult = Int.max, maxResult = Int.min

solution(n, 0)

print("\(minResult) \(maxResult)")
