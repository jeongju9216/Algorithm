//
//  1309.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/13.
//

import Foundation

class Solution {
    func freqAlphabets(_ s: String) -> String {
        //두 개를 담고 다음이 #이면 # 넣은거로
        //아니면 두 개 글자 추가
        let arr = Array(s)
        var result = ""
        var i = 0
        while i < arr.count {
            if i + 2 < arr.count && arr[i+2] == "#" {
                var num = Int(String(arr[i..<i+2]))! + Int("a".unicodeScalars.first!.value) - 1
                result += String(Character(UnicodeScalar(num)!))
                i = i + 3
            } else {
                var num = Int(String(arr[i]))! + Int("a".unicodeScalars.first!.value) - 1
                result += String(Character(UnicodeScalar(num)!))
                i = i + 1
            }
        }

        return result
    }
}
