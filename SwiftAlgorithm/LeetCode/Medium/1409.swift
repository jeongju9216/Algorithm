//
//  1409.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        var result: [Int] = []
        
        var arr: [Int] = Array(1...m)
        for query in queries {
            let index = arr.firstIndex(of: query)!
            result.append(index)
            
            arr.remove(at: index)
            
            arr = arr.reversed()
            arr.append(query)
            arr = arr.reversed()
        }
        
        return result
    }
}
