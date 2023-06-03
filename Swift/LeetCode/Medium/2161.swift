//
//  2161.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var frontArr: [Int] = []
        var pivotArr: [Int] = []
        var backArr: [Int] = []
        
        for num in nums {
            if num < pivot {
                frontArr.append(num)
            } else if num > pivot {
                backArr.append(num)
            } else {
                pivotArr.append(num)
            }
        }
        
        return frontArr + pivotArr + backArr
    }
}
