//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

func lowerbound(_ num: Int, _ arr: [Int]) -> Int {
    var start = 0, end = arr.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        if num > arr[mid] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result: [Int] = []
for num in arr {
    if result.isEmpty || result.last! < num {
        result.append(num)
    } else {
        //num 이상의 값 중 가장 가까운 값
        let index = lowerbound(num, result)
        result[index] = num
    }
}

print(result.count)
