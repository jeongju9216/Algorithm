//
//  1037.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/11.
//

import Foundation

let count = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }
    .map { Int(String($0))! }
    .sorted()

print(input[0] * input[count-1])
