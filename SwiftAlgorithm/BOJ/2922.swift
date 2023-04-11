//
//  2922.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

func backtracking(_ index: Int, _ jCount: Int, _ mCount: Int, _ isL: Bool, _ count: Int) {
    if index == input.count {
        if isL {
            result += count
        }
        return
    }
    
    let c = input[index]
    if c == "_" {
        //모음
        if mCount < 2 {
            backtracking(index + 1, 0, mCount + 1, isL, count * 5)
        }
        
        //자음
        if jCount < 2 {
            //L을 안 넣는 경우
            backtracking(index + 1, jCount + 1, 0, isL, count * 20)
            //L을 넣는 경우
            backtracking(index + 1, jCount + 1, 0, true, count)
        }
    } else if c == "A" || c == "E" || c == "I" || c == "O" || c == "U" {
        guard mCount < 2 else { return }
        
        backtracking(index + 1, 0, mCount + 1, isL, count)
    } else {
        guard jCount < 2 else { return }
        
        if c == "L" {
            backtracking(index + 1, jCount + 1, 0, true, count)
        } else {
            //일반 자음
            backtracking(index + 1, jCount + 1, 0, isL, count)
        }
    }
}

let input = Array(readLine()!)
var result = 0

//index, 자음 연속 개수, 모음 연속 개수, L 포함 여부, 현재 상태로 만들 수 있는 종류
backtracking(0, 0, 0, false, 1)

print(result)
