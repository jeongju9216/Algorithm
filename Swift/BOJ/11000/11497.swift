//
//  11497.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

//작은거를 양쪽으로 놓으면서 배치
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()
    
    var arr1: [Int] = [], arr2: [Int] = []
    
    for i in 0..<n {
        if i % 2 == 0 {
            arr1.append(arr[i])
        } else {
            arr2.append(arr[i])
        }
    }
    arr1 += arr2.reversed()
    
    let result = (1..<n).map {
        abs(arr1[$0] - arr1[$0-1])
    }.max()!
    print(result)
}
