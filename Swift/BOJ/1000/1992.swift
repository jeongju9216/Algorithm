//
//  1992.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/08.
//

import Foundation

func quard(_ x: Int, _ y: Int, _ size: Int) -> String {
    let half = size / 2
    
    var item = arr[x][y]
    var str = ""
    for i in x..<x+size {
        for j in y..<y+size {
            if arr[i][j] != item {
                str += quard(x, y, half)
                str += quard(x, y + half, half)
                str += quard(x + half, y, half)
                str += quard(x + half, y + half, half)
                return "(\(str))"
            }
        }
    }
    
    return "\(item)"
}

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    let item = readLine()!.map { Int(String($0))! }
    arr.append(item)
}

let result = quard(0, 0, n)
print(result)
