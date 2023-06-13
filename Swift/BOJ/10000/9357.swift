//
//  9357.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/13.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dict: [String: [String]] = [:]
    for _ in 0..<n {
        let input = readLine()!.split { $0 == " " }.map { String($0) }
        dict[input[1], default: []].append(input[0])
    }
    
    var result = 1
    for items in dict.values {
        result *= (items.count + 1)
    }
    result -= 1
    
    print(result)
}
