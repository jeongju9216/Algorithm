//
//  168.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        var result: String = ""
        var number: Int = columnNumber
        
        while number > 0 {
            result = String(UnicodeScalar((number-1) % 26 + 65)!) + result
            number = (number - 1) / 26
        }
        
        return result
    }
}
