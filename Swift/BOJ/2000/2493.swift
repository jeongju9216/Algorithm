//
//  2493.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/27.
//

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { Int($0)! }

var stack: [(index: Int, height: Int)] = [(1, input[0])]
var result: [Int] = [0]

for i in 1..<input.count {
    let item = input[i]
    
    while let top = stack.last {
        if item <= top.height {
            result.append(top.index)
            break
        } else {
            //아이템이 더 크면 pop
            stack.removeLast()
            if stack.isEmpty {
                result.append(0)
                break
            }
        }
    }
    
    stack.append((i + 1, item))
}

for num in result {
    print(num, terminator: " ")
}
