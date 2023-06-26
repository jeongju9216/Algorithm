//
//  1475.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/26.
//

import Foundation

let n = readLine()!.map { Int(String($0))! }
var arr: [Int] = Array(repeating: 0, count: 11)

for num in n {
    if num == 6 || num == 9 {
        if arr[6] <= arr[9] {
            arr[6] += 1
        } else {
            arr[9] += 1
        }
    } else {
        arr[num] += 1
    }
}

print(arr.max()!)
