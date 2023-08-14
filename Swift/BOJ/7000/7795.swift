//
//  7795.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let a = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()
    let b = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()
    
    var result = 0, cursor = 0
    for num in a {
        while cursor < b.count && num > b[cursor] {
            cursor += 1
        }
        
        result += cursor
    }
    
    print(result)
}
