//
//  1316.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let n = Int(readLine()!)!

var result = 0
for _ in 0..<n {
    let word = readLine()!.map { String($0) }
    var dict: [String: Int] = [:]
    var isGroup = true
    for i in 0..<word.count {
        if let idx = dict[word[i]], idx != i - 1 {
            isGroup = false
            break
        }
        dict[word[i]] = i
    }
    
    if isGroup {
        result += 1
    }
}

print(result)
