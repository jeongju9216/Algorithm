//
//  5635.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/08.
//

import Foundation

let n = Int(readLine()!)!
var people: [[String]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ")
    people.append(input)
}

people.sort {
    if $0[3] != $1[3] {
        return Int($0[3])! < Int($1[3])!
    } else if $0[2] != $1[2] {
        return Int($0[2])! < Int($1[2])!
    } else {
        return Int($0[1])! < Int($1[1])!
    }
}

print(people.last![0])
print(people.first![0])
