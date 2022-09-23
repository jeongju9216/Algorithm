//
//  1347.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        let s: [Character] = Array(s)
        let t: [Character] = Array(t)

        //딕셔너리에 s의 문자를 넣고 카운트를 함 a:1 b:2
        //t를 돌면서 딕셔너리에 있는걸 뺌 a:2 b:1
        //abs(s(a) - t(a)) + ... + abs(s(z) - t(z)) = result
        var dict: [Character: Int] = [:]
        for i in 0..<s.count {
            dict[s[i], default: 0] += 1
            dict[t[i], default: 0] -= 1
        }

        var result: Int = 0
        for num in dict.values {
            if num > 0 {
                result += num
            }
        }

        return result
    }
}
