//
//  1323.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var result: Int = num
        
        var arr: [Character] = Array(String(num))
        var tmp = arr
        for i in 0..<arr.count {
            if arr[i] == "6" {
                arr[i] = "9"
            } else {
                arr[i] = "6"
            }
            
            let newInt: Int = Int(String(arr))!
            result = max(result, newInt)
            
            arr = tmp
        }
        
        return result
    }
}
