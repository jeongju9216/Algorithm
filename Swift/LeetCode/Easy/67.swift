//
//  67.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a)
        let b = Array(b)
        
        var i = a.count - 1
        var j = b.count - 1
        var carry: Int = 0
        
        var result: String = ""
        while i >= 0 || j >= 0 || carry > 0 {
            var sum: Int = carry
            
            if i >= 0 {
                sum += Int(String(a[i]))!
                i -= 1
            }
            
            if j >= 0 {
                sum += Int(String(b[j]))!
                j -= 1
            }
            
            result = "\(sum % 2)" + result
            carry = sum / 2
        }
        
        return result
    }
}
