//
//  택배상자.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/12.
//

import Foundation

func solution(_ order:[Int]) -> Int {
    
    //스택을 이용
    
    //order에 맞지 않은 순서면 stack에 push
    //order에 맞으면 result += 1 후 top이 order와 같으면 계속 pop -> result += 1
    //모든 아이템이 스택에 있고 스택의 top이 order와 다르면 더이상 쌓을 수 없음
    
    let total: Int = order.count //전체 박스 개수
    var stack: [Int] = []
    var result: Int = 0
    for box in 1...total {
        stack.append(box)
        
        while let top = stack.last, top == order[result] {
            result += 1
            stack.popLast()
        }
    }
    
    return result
}
