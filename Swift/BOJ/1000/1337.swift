//
//  1337.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/11.
//

import Foundation

let n = Int(readLine()!)!
var set: Set<Int> = []
for _ in 0..<n {
    set.insert(Int(readLine()!)!)
}

var result = 5 //최대값
for num in set {
    var cnt = 0
    
    for i in 0..<5 {
        if !set.contains(num + i) {
            cnt += 1
        }
    }
    
    result = min(result, cnt)
}

print(result)
