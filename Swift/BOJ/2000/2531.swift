//
//  2531.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/11.
//

import Foundation

//접시수, 가짓수, 연속 접시 수, 쿠폰 번호
let ndkc = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, d, k, c) = (ndkc[0], ndkc[1], ndkc[2], ndkc[3])

var arr: [Int] = []
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}

var left = 0, right = k - 1
var checked = Array(repeating: 0, count: d + 1)
var result = 0, count = 0

//처음 k개
for i in left...right {
    checked[arr[i]] += 1
    if checked[arr[i]] == 1 {
        count += 1
    }
}
result = count

while left < n {
    checked[arr[left]] -= 1
    if checked[arr[left]] == 0 {
        count -= 1
    }
    left += 1

    right += 1
    if right == n {
        right = 0
    }
    checked[arr[right]] += 1
    if checked[arr[right]] == 1 {
        count += 1
    }

    if checked[c] == 0 {
        result = max(result, count + 1)
    } else {
        result = max(result, count)
    }
}

print(result)
