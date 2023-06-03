//
//  뒤에_있는_큰_수_찾기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/14.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    //number와 index 튜플로 묶기
    //하나씩 스택에 넣기
    //number가 더 큰 아이템이 push 되면 pop하고 index에 new push 아이템 넣기
    //반복이 끝났을 때 스택에 남아있는건 -1 로 넣기
    var result: [Int] = Array(repeating: -1, count: numbers.count)
    
    var stack: [(number: Int, offset: Int)] = []
    for (offset, number) in numbers.enumerated() {
        while let last = stack.last, last.number < number {
            stack.popLast()
            result[last.offset] = number
        }
        
        stack.append((number, offset))
    }
    
    return result
}
