//
//  33.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/15.
//

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        //오름차순된 배열이 shift 된 게 포인트
        //0번 index가 마지막 index보다 작으면 오름차순
        //이분 탐색
        //nums[mid]가 target이면 return mid
        //nums[mid]가 target보다 크면 left를 mid + 1
        //nums[mid]가 target보다 작으면 right를 mid - 1로
        
        var left: Int = 0, right: Int = nums.count - 1
        
        while left <= right {
            let mid: Int = (left + right) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[left] <= nums[mid] {
                if nums[left] <= target, target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[mid] <= nums[right] {
                if nums[mid] < target, target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        
        return -1
    }
}
