//
//  가장 가까운 같은 글자.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/13.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    //딕셔너리로 알파벳 : index 저장
    //딕셔너리에 value가 있으면 현재 index - index append -> 딕셔너리 index 업뎃
    //딕셔너리에 없으면 -1 append
    
    var result: [Int] = []
    var dict: [Character: Int] = [:]
    var chars: [Character] = Array(s)
    for i in 0..<chars.count {
        if let index = dict[chars[i]] {
            result.append(i - index)
        } else {
            result.append(-1)
        }
        
        dict[chars[i]] = i
    }
    
    return result
}
