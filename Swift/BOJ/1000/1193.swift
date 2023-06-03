//
//  1193.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/02.
//

import Foundation

var x = Int(readLine()!)!

var index = 1
while x > index {
    x -= index
    index += 1
}

if index % 2 != 0 {
    print("\(index + 1 - x)/\(x)")
} else {
    print("\(x)/\(index + 1 - x)")
}
