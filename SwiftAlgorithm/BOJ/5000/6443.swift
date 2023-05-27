//
//  6443.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ current: String) {
    if current.count == input.count {
        print(current)
        return
    }
    
    for i in 0..<26 where counted[i] > 0 {
        counted[i] -= 1
        
        backtracking(current + "\(Character(UnicodeScalar(i+97)!))")
        
        counted[i] += 1
    }
}

let testcase = Int(readLine()!)!
var input: [Character] = []
var counted: [Int] = []

for _ in 0..<testcase {
    input = Array(readLine()!)
    counted = Array(repeating: 0, count: 26)
    
    for char in input {
        let index = Int(char.asciiValue!) - 97
        counted[index] += 1
    }
    
    backtracking("")
}
