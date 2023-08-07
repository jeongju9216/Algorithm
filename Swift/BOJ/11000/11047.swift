//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//11047 동전 0
import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nk[0]
var k = nk[1]
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var result = 0
for money in arr.reversed() {
    if money <= k {
        let cnt = k / money
        result += cnt
        k -= (cnt * money)
    }
    
    if k <= 0 {
        break
    }
}

print(result)
