//
//  1316.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/02.
//

import Foundation

//딕셔너리로 처음 들어온거 확인
//떨어져있는데 딕셔너리에 이미 앏파벳이 있으면 그룹단어가 아님

let n = Int(readLine()!)!

var result = 0

for _ in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    var isGroupWord = true
    
    var dict: [String: Int] = [:]
    var last: String = ""
    for char in input {
        if last != char {
            if dict[char] == nil {
                last = char
                dict[char] = 0
            } else {
                isGroupWord = false
                break
            }
        }
    }
    
    if isGroupWord {
        result += 1
    }
}

print(result)
