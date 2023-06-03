//
//  110 옮기기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

//110을 전부 제외
//마지막 0 위치 뒤에 110 개수만큼 삽입

func makeResult(_ string: String) -> String {
    var arr = Array(string).map { String($0) }
    var stack: [String] = []
    var count = 0
    for char in arr {
        if stack.count < 2 {
            stack.append(char)
        } else {
            if char == "0" {
                if stack[stack.count-1] == "1" && stack[stack.count-2] == "1" {
                    stack.removeLast(2)
                    count += 1
                } else {
                    stack.append(char)
                }
            } else {
                stack.append(char)
            }
        }
    }
    
    let inputString = Array(repeating: "110", count: count)
    
    if stack.contains("0") {
        var insertIndex = 0

        for i in (0..<stack.count).reversed() {
            if stack[i] == "0" {
                insertIndex = i
                break
            }
        }
        
        stack.insert(contentsOf: inputString, at: insertIndex + 1)
    } else {
        stack = inputString + stack
    }
    
    return stack.joined()
}

func solution(_ s: [String]) -> [String] {
    
    var result: [String] = []
    for string in s {
        let str = makeResult(string)
        result.append(str)
    }
    
    return result
}
