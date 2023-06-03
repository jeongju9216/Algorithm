//
//  11497.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/22.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
    
    var arr1: [Int] = [], arr2: [Int] = []
    for i in 0..<n {
        if i % 2 != 0 {
            arr1.append(input[i])
        } else {
            arr2.append(input[i])
        }
    }
    arr2 = arr2.reversed()
    
    var arr = arr1 + arr2
    var diff = 0
    for i in 1..<n {
        diff = max(diff, abs(arr[i] - arr[i-1]))
    }
    
    print(diff)
}
