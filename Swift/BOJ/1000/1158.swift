//
//  1158.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])

var arr = Array(1...n)
var index = 0
var result: [Int] = []

for _ in 0..<n {
    index += k-1
    index %= arr.count
    
    result.append(arr[index])
    arr.remove(at: index)
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")

