//
//  1281.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/28.
//

import Foundation

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        let arr: [Int] = String(n).map { Int(String($0))! }
        
        let product = arr.reduce(1, *)
        let sum = arr.reduce(0, +)
        
        return product - sum
    }
}
