//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//2875 대회 or 인턴
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var woman = input[0]
var man = input[1]
let intern = input[2]

for _ in 0..<intern {
    if woman / 2 >= man {
        woman -= 1
    } else {
        man -= 1
    }
}

print("\(min(woman/2, man))")
