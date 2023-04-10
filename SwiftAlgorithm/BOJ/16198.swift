//
//  16198.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ arr: [Int], _ sum: Int) {
    if arr.count < 3 {
        result = max(result, sum)
        return
    }
    
    var arr = arr
    let size = arr.count
    for i in 1..<size-1 {
        let tmp = arr[i]
        let resultOp = arr[i-1] * arr[i+1]
        
        arr.remove(at: i)
        backtracking(arr, sum + resultOp)
        arr.insert(tmp, at: i)
    }
}

let n = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { Int($0)! }

var result = 0

backtracking(input, 0)

print(result)
