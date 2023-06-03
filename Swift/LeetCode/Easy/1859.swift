//
//  1859.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func sortSentence(_ s: String) -> String {
        var result: String = ""

        var s: [String] = s.components(separatedBy: " ")
        s = s.sorted { Int(String($0.last!))! < Int(String($1.last!))! }

        for sen in s {
            result += "\(String(sen.dropLast(1))) "
        }

        return String(result.dropLast(1))
    }
}
