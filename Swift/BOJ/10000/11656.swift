//
//  11656.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/03.
//

import Foundation

let str = Array(readLine()!)

var arr: [String] = []
for i in 0..<str.count {
    arr.append(String(str[i...]))
}

arr.sorted().forEach {
    print($0)
}
