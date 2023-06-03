//
//  10825.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/03.
//

import Foundation

let n = Int(readLine()!)!
var arr: [(name: String, k: Int, e: Int, m: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    arr.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

arr.sort {
    if $0.k != $1.k {
        return $0.k > $1.k
    } else if $0.e != $1.e {
        return $0.e < $1.e
    } else if $0.m != $1.m {
        return $0.m > $1.m
    } else {
        return $0.name < $1.name
    }
}

for name in arr.map { $0.name } {
    print(name)
}
