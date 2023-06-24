//
//  10814.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/23.
//

import Foundation

let n = Int(readLine()!)!
var arr: [(age: Int, name: String)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    arr.append((Int(input[0])!, input[1]))
}

arr.sort {
    if $0.age != $1.age {
        return $0.age < $1.age
    } else {
        return false
    }
}

for item in arr {
    print("\(item.age) \(item.name)")
}
