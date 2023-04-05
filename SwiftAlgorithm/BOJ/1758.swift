//
//  1758.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//원래 줄려는 팁 순으로 내림차순 정렬

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

var result = 0
for i in 0..<arr.count {
    let tip = arr[i] - i
    if tip > 0 {
        result += tip
    }
}

print(result)
