//
//  25644.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/18.
//

import Foundation

//차이가 -가 되면 min 값을 바꿈

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var minValue = arr[0]
var result = 0
for i in 0..<n {
    let diff = arr[i] - minValue
    if diff < 0 {
        minValue = arr[i]
    }
    result = max(result, diff)
}

print(result)
