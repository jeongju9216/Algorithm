//
//  햄버거 만들기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    guard ingredient.count >= 4 else {
        return 0
    }
    
    //조리된 순서대로 상수의 앞에 아래서부터 위로 쌓임
    //순서에 맞게 쌓여서 완성된 햄버거를 포장
    //1 - 2 - 3 - 1 햄버거 포장만 함
    
    //스택을 이용해서 pop
    var stack: [Int] = []
    var result: Int = 0
    for num in ingredient {
        stack.append(num)
        
        while stack.count >= 4 {
            let sub: [Int] = Array(stack[stack.count-4...stack.count-1])

            if sub == [1, 2, 3, 1] {
                stack.removeLast(4)
                
                result += 1
            } else {
                break
            }
        }
    }
    
    if stack.count >= 4 && Array(stack[stack.count-4...stack.count-1]) == [1, 2, 3, 1] {
        result += 1
    }
    
    return result
}
