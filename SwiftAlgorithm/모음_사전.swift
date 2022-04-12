//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/11.
//

import Foundation

func solution(_ word:String) -> Int {

    let firstAlphabet = String(word.first!)
    let alphabets = ["U", "O", "I", "E", "A"]
    
    var count = 0
    for ch in alphabets.reversed() {
        if firstAlphabet == ch {
            break
        } else {
            count += 781
        }
    }
    
    var stack: [String] = [firstAlphabet]
    while !stack.isEmpty {
        let top = stack.popLast()!
        count += 1
        if top == word {
            break
        }
            
        for alphabet in alphabets {
            let next = top + String(alphabet)
            if next.count > 5 {
                continue
            }
            
            stack.append(next)
        }
    }
        
    return count
}

//func solution(_ word:String) -> Int {
//    var answer = word.count
//    var count = 0
//    let arr = [781, 156, 31, 6, 1]
//    let arr2 = ["A": 0, "E": 1, "I": 2, "O":3, "U":4]
//
//    for ch in word{
//        answer += arr2[String(ch)]!*arr[count]
//        count += 1
//    }
//    return answer
//}

print(solution("AAAAE"))
