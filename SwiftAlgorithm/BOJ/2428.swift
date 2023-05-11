//
//  2428.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/11.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.components(separatedBy: " ").map { Double($0)! }.sorted()

var result = 0
for i in 0..<arr.count-1 {
    let filesize = arr[i]
    
    var left = 0, right = n
    while left < right {
        let mid = (left + right) / 2
        
        if arr[mid] * 0.9 <= filesize {
            left = mid + 1
        } else {
            right = mid
        }
    }
        
    result += left - i - 1
}

print(result)
