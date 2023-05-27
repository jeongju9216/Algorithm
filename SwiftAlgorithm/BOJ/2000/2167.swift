//
//  2167.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/04.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var arr: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    arr.append(input)
}

let k = Int(readLine()!)!
for _ in 0..<k {
    let ijxy = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let i = ijxy[0]-1, j = ijxy[1]-1, x = ijxy[2]-1, y = ijxy[3]-1
    
    var result = 0
    for index1 in i...x {
        for index2 in j...y {
            result += arr[index1][index2]
        }
    }
    
    print(result)
}
