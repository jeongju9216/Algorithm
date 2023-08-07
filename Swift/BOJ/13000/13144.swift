//
//  13144.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/09.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }

var result = 0

var left = 0, right = 0
var dict: [Int: Int] = [:]

while right < n {
    if dict[arr[right]] != nil {
        dict[arr[left]] = nil
        left += 1
    } else {
        dict[arr[right]] = 1
        right += 1
        
        result += right - left
    }
}

print(result)
