//
//  7795.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/03.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
    let n = nm[0], m = nm[1]
    
    let arrA = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
    let arrB = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
    
    var result = 0, cursor = 0
    for a in arrA {
        while cursor < m && a > arrB[cursor] {
            cursor += 1
        }
        
        result += cursor
    }
    
    print(result)
}
