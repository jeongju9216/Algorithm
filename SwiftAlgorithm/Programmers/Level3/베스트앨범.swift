//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/09.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var hashtable: [String: [(Int, Int)]] = [:]
    var sumTable: [String: Int] = [:]
    var mostGenres: [String] = []
    var result: [Int] = []
    
    //장르별로 해시테이블에 넣는다. String : [(index: Int, count: Int)]
    for (i, genre) in genres.enumerated() {
        if let _ = hashtable[genre] {
            hashtable[genre]?.append((plays[i], i))
            sumTable[genre]? += plays[i]
        } else {
            hashtable[genre] = [(plays[i], i)]
            sumTable[genre] = plays[i]
        }
    }
    
    mostGenres = sumTable.keys.sorted { sumTable[$0]! > sumTable[$1]! }
    
    for genre in mostGenres {
        hashtable[genre]!.sort { $0.0 > $1.0 }
        
        if let music = hashtable[genre] {
            if music.count >= 2 {
                result.append(contentsOf: [music[0].1, music[1].1])
            } else {
                result.append(music[0].1)
            }
        }
    }
    
    return result
}
