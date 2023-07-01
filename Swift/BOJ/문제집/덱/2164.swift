//
//  2164.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/01.
//

import Foundation

let n = Int(readLine()!)!

var arr: [Int] = Array(1...n)
var index = 0
while true {
    index += 1
    if index == arr.count {
        break
    }
    
    arr.append(arr[index])
    index += 1
}

print(arr[index-1])
