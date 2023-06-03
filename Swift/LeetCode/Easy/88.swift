//
//  88.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var sortedArray: [Int] = []
        
        var count1 = 0, count2 = 0
        while count1 < m && count2 < n {
            if nums1[count1] <= nums2[count2] {
                sortedArray.append(nums1[count1])
                count1 += 1
            } else {
                sortedArray.append(nums2[count2])
                count2 += 1
            }
        }
        
        if count1 < m {
            for i in count1..<m {
                sortedArray.append(nums1[i])
            }
        }
        
        if count2 < n {
            for i in count2..<n {
                sortedArray.append(nums2[i])
            }
        }
        
        
        nums1 = sortedArray
    }
}
