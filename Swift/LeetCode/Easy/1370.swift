//
//  1370.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/21.
//

import Foundation

class Solution {
    func sortString(_ s: String) -> String {
        var map: [Int] = Array(repeating: 0, count: 26)
        
        for unicode in s.utf8 {
            map[Int(unicode) - 97] += 1
        }
        
        var result: [Character] = []
        while result.count < s.count {
            for i in 0..<26 {
                guard map[i] > 0 else {
                    continue
                }
                
                map[i] -= 1
                result.append(Character(UnicodeScalar(i + 97)!))
            }
            for i in (0..<26).reversed() {
                guard map[i] > 0 else {
                    continue
                }
                
                map[i] -= 1
                result.append(Character(UnicodeScalar(i + 97)!) )
            }
        }
        
        return String(result)
    }
}
