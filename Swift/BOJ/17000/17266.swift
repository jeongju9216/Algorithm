//
//  17266.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let pos = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var left = 1, right = n
var result = 0
while left <= right {
    let height = (left + right) / 2
    var arr: [Int] = Array(repeating: 0, count: n)
    for x in pos {
        arr[max(0, x-height)] += 1
        
        if x+height < arr.count {
            arr[x+height] -= 1
        }
    }
    
    var emptyCount = 0
    for i in 0..<arr.count {
        if i > 0 {
            arr[i] += arr[i-1]
        }
        
        if arr[i] <= 0 {
            emptyCount += 1
        }
    }
    
    //가능하면 높이를 낮춤
    if emptyCount == 0 {
        result = height
        right = height - 1
    } else {
        //안 되면 높이를 높임
        left = height + 1
    }
}

print(result)
