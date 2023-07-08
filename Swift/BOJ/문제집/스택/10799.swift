//
//  10799.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/08.
//

import Foundation

let arr = Array(readLine()!)
var count = 0, result = 0
for i in 0..<arr.count {
    if arr[i] == "(" {
        count += 1
    } else {
        count -= 1
        if arr[i-1] == "(" {
            //레이저일 때
            result += count
        } else {
            //파이프 끝일 때
            result += 1
        }
    }
}

print(result)
