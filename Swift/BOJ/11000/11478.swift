//
//  11478.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/23.
//

import Foundation

let arr = Array(readLine()!)

var set: Set<String> = []
set.insert(String(arr))

for i in 0..<arr.count {
    var tmp = ""
    for j in i..<arr.count {
        tmp += String(arr[j])
        set.insert(tmp)
    }
}

print(set.count)
