//
//  9996.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

let n = Int(readLine()!)!
let pattern = readLine()!.split { $0 == "*" }.map { String($0) }

var words: [String] = []
for _ in 0..<n {
    var word = readLine()!
    
    if word.hasPrefix(pattern[0]) {
        word = String(word.dropFirst(pattern[0].count))
    } else {
        print("NE")
        continue
    }
    
    if word.hasSuffix(pattern[1]) {
        print("DA")
    } else {
        print("NE")
        continue
    }
}
