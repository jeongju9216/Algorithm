//
//  10799.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

let arr = readLine()!.map { String($0) }

var count = 0, result = 0
for i in 0..<arr.count {
    if arr[i] == "(" {
        count += 1
    } else {
        let last = arr[i-1]
        count -= 1
        if last == "(" {
            //레이저라면
            result += count
        } else if last == ")" {
            //파이프 끝
            result += 1
        }
    }
}

print(result)
