//
//  1543.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

let s = Array(readLine()!).map { String($0) }
let word = readLine()!

var result = 0
var i = 0
while i <= s.count - word.count {
    if s[i..<i + word.count].joined() == word {
        result += 1
        i += word.count
        continue
    }
    
    i += 1
}

print(result)
