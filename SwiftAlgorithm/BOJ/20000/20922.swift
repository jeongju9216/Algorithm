//
//  20922.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/29.
//

import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var dict: [Int: Int] = [:]

var result = 0
var left = 0, right = 0
while right < n {
    guard let count = dict[input[right]] else {
        dict[input[right]] = 1
        right += 1
        result = max(result, right - left)
        continue
    }
    
    //넣을 수 있음
    if count < k {
        dict[input[right]] = count + 1
        right += 1
    } else { //못 넣음
        dict[input[left]]! -= 1
        if dict[input[left]]! == 0 {
            dict[input[left]] = nil
        }
        
        left += 1
    }
    
    result = max(result, right - left)
}

print(result)
