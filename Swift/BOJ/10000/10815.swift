//
//  10815.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let n = Int(readLine()!)!
let arr1 = Set(readLine()!.split { $0 == " " }.map { Int(String($0))! })
let m = Int(readLine()!)!
let arr2 = readLine()!.split { $0 == " " }.map { Int(String($0))! }

for num in arr2 {
    if arr1.contains(num) {
        print("1", terminator: " ")
    } else {
        print("0", terminator: " ")
    }
}
