//
//  3273.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/26.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()
let x = Int(readLine()!)!

var result = 0
var left = 0, right = n - 1
while left < right {
    let sum = arr[left] + arr[right]
    
    if sum == x {
        result += 1
        left += 1
    } else if sum < x {
        left += 1
    } else if sum > x {
        right -= 1
    }
}

print(result)
