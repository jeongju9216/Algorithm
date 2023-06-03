//
//  2661.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func isGood(_ current: [Character]) -> Bool {
    guard current.count > 1 else {
        return true
    }
    
    let maxIndex = current.count
    //새로 추가한 글자를 포함해야 하므로 뒤에서부터 체크
    for i in 1...current.count / 2 {
        let s1 = current[maxIndex-i..<maxIndex]
        let s2 = current[maxIndex-i-i..<maxIndex-i]
                
        if s1 == s2 {
            return false
        }
    }
    
    return true
}

func backtracking(_ current: [Character]) {
    guard isGood(current), result.isEmpty else {
        return
    }
    
    if current.count == input {
        result = String(current)
        return
    }
    
    backtracking(current + ["1"])
    backtracking(current + ["2"])
    backtracking(current + ["3"])
}

let input = Int(readLine()!)!

var result = ""

backtracking([])

print(result)
