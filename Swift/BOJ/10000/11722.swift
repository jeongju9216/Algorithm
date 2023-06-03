//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/24.
//

//11722 가장 긴 감소하는 부분 수열
import Foundation

func upperBound(find: Int, numbers: [Int]) -> Int {
    var start: Int = 0
    var end: Int = numbers.count - 1
    var mid: Int = 0
    
    while start < end {
        mid = (start + end) / 2
        if find < numbers[mid] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

let input = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp: [Int] = []
for number in numbers {
    if dp.isEmpty {
        dp.append(number)
        continue
    }
    
    if number < dp.last! {
        dp.append(number)
    } else {
        let index = upperBound(find: number, numbers: dp)
        dp[index] = number
    }
}

print(dp.count)
