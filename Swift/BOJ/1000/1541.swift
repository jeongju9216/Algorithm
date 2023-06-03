//
//  1541.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//더하기 먼저 한 번에 하고, 한 번에 빼기 

let input = readLine()!.components(separatedBy: "-")

var arr: [Int] = []
for i in 0..<input.count {
    if let num = Int(input[i]) {
        arr.append(num)
    } else {
        let tmp = input[i].components(separatedBy: "+").map { Int($0)! }
        arr.append(tmp.reduce(0, +))
    }
}

let result = arr.reduce(arr[0], -) + arr[0]
print(result)
