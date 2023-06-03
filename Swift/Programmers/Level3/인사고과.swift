//
//  인사고과.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

func solution(_ scores:[[Int]]) -> Int {
    
    var target = scores[0]
    var targetSum = target[0] + target[1]
    
    var scores = scores.sorted { $0[0] != $1[0] ? $0[0] > $1[0] : $0[1] < $1[1] }
    var result = 1, tmp = 0
    
    for score in scores {
        //원호 아래는 체크 안 해도 됨
        if targetSum >= score[0] + score[1] {
            continue
        }
        
        //원호가 못 받는 경우
        if target[0] < score[0] && target[1] < score[1] {
            result = -1
            break
        }
        
        //이전 score[i-1][1]보다 작으면 인센을 못 받음 -> score[0]으로 정렬해놔서
        if tmp <= score[1] {
            tmp = score[1]
            result += 1
        }
    }
    
    return result
}
