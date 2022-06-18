//
//  MaxCounters.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/18.
//

import Foundation

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var array: [Int] = Array(repeating: 0, count: N)
    var maxValue = 0, maxCounter = 0
    for counter in A {
        if counter == N+1 {
            maxCounter = maxValue //맨 뒤에 후처리 한다
        } else {
            if array[counter-1] < maxCounter {
                array[counter-1] = maxCounter
            }
            array[counter-1] += 1
            maxValue = max(maxValue, array[counter-1]) //array.max()는 O(N)
        }
    }

    for (i, num) in array.enumerated() {
        if num < maxCounter {
            array[i] = maxCounter
        }
    }

    return array
}

//O(N+M)
//public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
//    var array: [Int] = Array(repeating: 0, count: N)
//    var maxValue = 0
//    for counter in A {
//        if counter == N+1 {
//            array = Array(repeating: maxValue, count: N)
//        } else {
//            array[counter-1] += 1
//            maxValue = max(maxValue, array[counter-1]) //array.max()는 O(N)
//        }
//    }
//
//    return array
//}

