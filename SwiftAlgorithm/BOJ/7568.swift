//
//  7568.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/02.
//

import Foundation

let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    arr.append((input[0], input[1]))
}

var result: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
    var count = 1
    for j in 0..<n where i != j {
        if arr[i].x < arr[j].x && arr[i].y < arr[j].y {
            count += 1
        }
    }
    result[i] = count
}

for num in result {
    print(num, terminator: " ")
}
