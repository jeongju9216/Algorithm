//
//  23304.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/16.
//

import Foundation

func isAkaraka(_ string: [Character]) -> Bool {
    if string.count == 1 {
        return true
    }
    
    let length = string.count
    let mid = Int(floor(Double(length) / 2.0))
    
    let front = Array(string[..<mid])
    var tail: [Character] = []
    if length % 2 == 0 {
        tail = Array(string[mid...])
    } else {
        tail = Array(string[(mid+1)...])
    }
    
    if front != tail.reversed() {
        return false
    }
    
    return isAkaraka(front)
}


let str = Array(readLine()!)

let result = isAkaraka(str)

if result {
    print("AKARAKA")
} else {
    print("IPSELENTI")
}
