//
//  190.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/08.
//

import Foundation

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var binaryString: String = String(n, radix: 2)
        binaryString = String(repeating: "0", count: 32 - binaryString.count) + binaryString
        
        let reversedBinary = binaryString.reversed()
        
        return Int(String(reversedBinary), radix: 2)!
    }
}

