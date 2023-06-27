//
//  1158.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/27.
//

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nk[0], k = nk[1]

var arr = Array(1...n)
var result: [Int] = []
var index = 0, count = 1
while result.count < n {
    while arr[index] == -1 {
        index += 1
        if index == n {
            index = 0
        }
    }
    
    if count == k {
        result.append(arr[index])
        arr[index] = -1
        count = 0
    }
    
    index += 1
    if index == n {
        index = 0
    }
    
    count += 1
}

print("<", terminator: "")
result[0..<n-1].forEach { print($0, terminator: ", ") }
print("\(result.last!)>")
