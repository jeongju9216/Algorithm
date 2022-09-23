//
//  1678.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func interpret(_ command: String) -> String {
        
        var arr: [Character] = Array(command)
        var tmp: String = ""
        var result: String = ""
        for char in arr {
            tmp += String(char)
        
            switch tmp {
            case "G":
                result += "G"
                tmp = ""
            case "()":
                result += "o"
                tmp = ""
            case "(al)":
                result += "al"
                tmp = ""
            default: break
            }
        }
        
        return result
    }
}
