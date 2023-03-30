//
//  2470.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/30.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var left = 0, right = n - 1
var indexes: [Int] = [0, 0]
var sum = Int.max
while left < right {
    let newSum = input[left] + input[right]
    //새로운 left, right가 0에 더 가까우면
    if abs(sum - 0) > abs(newSum - 0) {
        indexes[0] = left
        indexes[1] = right
        sum = newSum
    } else {
        let sum1 = input[left+1] + input[right]
        let sum2 = input[left] + input[right-1]
        
        if abs(sum1 - 0) < abs(sum2 - 0) {
            left += 1
        } else {
            right -= 1
        }
    }
}

print("\(input[indexes[0]]) \(input[indexes[1]])")
