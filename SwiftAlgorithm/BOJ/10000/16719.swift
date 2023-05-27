//
//  16719.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

func splitArray(_ left: Int, _ right: Int) {
    guard left <= right else { return }
    
    var index = left
    for i in left...right {
        if input[i] < input[index] {
            index = i
        }
    }
    
    checked[index] = true
    let str: [String] = input.enumerated().filter { checked[$0.offset] }.map { $0.element }
    print(str.joined())
    
    splitArray(index + 1, right)
    splitArray(left, index - 1)
}

let input = Array(readLine()!).map { String($0) }
var checked = Array(repeating: false, count: input.count)

splitArray(0, input.count - 1)

