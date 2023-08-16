//
//  1912.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/15.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
for i in 1..<n {
    arr[i] = max(arr[i-1] + arr[i], arr[i])
}

print(arr.max()!)
