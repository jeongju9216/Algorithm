//
//  921.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        //짝이 안 맞는 괄호 개수 카운트
        var arr: [Character] = Array(s)
        var stack: [Character] = []
        for char in arr {
            if char == ")" {
                if let top = stack.last, top == "(" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            } else {
                stack.append(char)
            }
        }

        return stack.count
    }
}
