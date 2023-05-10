//
//  12904.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let s = Array(readLine()!)
var t = Array(readLine()!)

var result = 0

while true {
    guard let last = t.last else {
        break
    }
    
    if s == t {
        result = 1
        break
    }
    
    t.removeLast()
    if last == "B" {
        t = t.reversed()
    }
}

print(result)
