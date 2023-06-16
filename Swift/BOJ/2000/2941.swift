//
//  2941.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

var s = readLine()!

let words = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
words.forEach {
    s = s.replacingOccurrences(of: $0, with: "*")
}

print(s.count)
