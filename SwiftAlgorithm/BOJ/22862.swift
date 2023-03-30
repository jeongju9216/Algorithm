//
//  22862.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/30.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
let input = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0, right = 0
var length = 0, oddCount = 0

if input[left] % 2 == 0 {
    length += 1
} else {
    oddCount += 1
}

while right + 1 < n {
    right += 1

    if input[right] % 2 != 0 {
        oddCount += 1
        while oddCount > k && left < right {
            if input[left] % 2 != 0 {
                oddCount -= 1
            }
            left += 1
        }
    }
    
    length = max(length, right - left - oddCount + 1)
}

print(length)
