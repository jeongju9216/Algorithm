//
//  58.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let arr = Array(s.trimmingCharacters(in: [" "])).split { $0 == " " }
        
        return arr.last!.count
    }
}
