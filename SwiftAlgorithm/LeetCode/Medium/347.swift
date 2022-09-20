//
//  347.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/18.
//

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int: (Int, Int)] = [:]
        
        for num in nums {
            if let cache = dict[num] {
                dict[num] = (num, cache.1 + 1)
            } else {
                dict[num] = (num, 1)
            }
        }
        // print("dict: \(dict)")
        
        var sortedDict: [(Int, Int)] = dict.values.sorted { $0.1 > $1.1 }
        // print("sortedDict: \(sortedDict)")
        
        var result: [Int] = []
        for i in 0..<k {
            result.append(sortedDict[i].0)
        }
        // print("result: \(result)")
        
        return result
    }
}
