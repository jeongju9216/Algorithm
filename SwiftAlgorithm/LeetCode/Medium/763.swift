//
//  763.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let arr: [Character] = Array(s)
        var dict: [Character: Int] = [:]
        for i in 0..<arr.count {
            dict[arr[i]] = i
        }
        
        var result: [Int] = []
        var partition: Int = 0
        var count: Int = 0
        for i in 0..<arr.count {
            count += 1
            
            let index = dict[arr[i]]!
            partition = max(partition, index)
            
            if partition == i {
                result.append(count)
                count = 0
            }
        }
        
        return result
    }
}
