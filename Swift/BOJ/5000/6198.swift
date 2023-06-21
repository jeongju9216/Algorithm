//
//  6198.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/21.
//

import Foundation

//모든 빌딩은 일렬로 서 있고, 오른쪽으로만 볼 수 있음
//높거나 같은 빌딩이 있으면 그 이후의 모든 빌딩을 볼 수 없음
//벤치마킹이 가능한 빌딩의 수의 합을 출력한다.

//스택으로 쌓으면서 top이 작은건 pop하고 새로 쌓음
//맥스값을 가지고 있으면서


let n = Int(readLine()!)!

var stack: [Int] = []
var result = 0
for _ in 0..<n {
    let input = Int(readLine()!)!

    while let top = stack.last, top <= input {
        stack.removeLast()
    }

    if stack.isEmpty {
        stack.append(input)
    } else {
        if let top = stack.last, top > input {
            //자기보다 큰 빌딩을 모두 더함
            result += stack.count
            stack.append(input)
        }
    }
}

print(result)
