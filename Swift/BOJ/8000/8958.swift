//
//  8958.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let arr = readLine()!.map { String($0) }
    var cnt = 0
    
    print(arr.map {
        cnt = $0 == "X" ? 0 : cnt + 1
        return cnt
    }.reduce(0, +))
}
