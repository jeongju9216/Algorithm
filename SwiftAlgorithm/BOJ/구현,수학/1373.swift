//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/01.
//

import Foundation

var input = readLine()!.reversed().map { String($0) }
if input.count % 3 > 0 {
    input.append(contentsOf: Array(repeating: "0", count: 3 - input.count % 3))
}
input = input.reversed()

var octString = ""
for i in stride(from: 0, to: input.count-1, by: 3) {
    let octNumber = (Int(input[i])! * 4) + (Int(input[i+1])! * 2) + Int(input[i+2])!
    octString += String(octNumber)
}

print(octString)
