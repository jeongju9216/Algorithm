//
//  1476.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func minimumSum(_ num: Int) -> Int {
        let arr = String(num).map { $0 }.sorted()
        
        let front = "\(arr[0])\(arr[3])"
        let back = "\(arr[1])\(arr[2])"
        
        return Int(front)! + Int(back)!
    }
}
