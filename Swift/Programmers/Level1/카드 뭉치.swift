//
//  카드 뭉치.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var cards1: [String] = cards1.reversed()
    var cards2: [String] = cards2.reversed()
    
    for card in goal {
        if let last1 = cards1.last, last1 == card {
            cards1.removeLast()
            continue
        }
        
        if let last2 = cards2.last, last2 == card {
            cards2.removeLast()
            continue
        }
        
        return "No"
    }
    
    return "Yes"
}
