//
//  혼자 놀기의 달인.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/13.
//

import Foundation

var dict: [Int: Int] = [:]
    
func openBox(_ index: Int) -> Int {
    guard let card = dict[index] else {
        return 0
    }
    
    dict[index] = nil
    let count = openBox(card)
    return count + 1
}

func solution(_ cards:[Int]) -> Int {
    
    var length: Int = cards.count
    for i in 1...length {
        dict[i] = cards[i-1] //i번 상자에 i-1 번호
    }
    
    var maxItems: [Int] = []
    //1~100까지 반복하면서 가장 많이 여는(다 여는거 제외) 경우 찾기
    for i in 1...length {
        guard let card = dict[i] else {
            continue
        }
        
        let count = openBox(card)
        maxItems.append(count)
    }
    
    maxItems = maxItems.sorted(by: >)
    
    return maxItems.count > 1 ? maxItems[0] * maxItems[1] : 0
}
