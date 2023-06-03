//
//  1166.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/01.
//

import Foundation

let nlwh = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nlwh[0]
let l = nlwh[1], w = nlwh[2], h = nlwh[3]

var left = 0.0, right = Double(max(l, w, h))
while left < right {
    let mid = (left + right) / 2.0
    
    let cnt = Int(Double(l) / mid) * Int(Double(w) / mid) * Int(Double(h) / mid)
    if cnt >= n {
        if left == mid {
            break
        }
        left = mid
    } else {
        if right == mid {
            break
        }
        right = mid
    }
}

print(left)
