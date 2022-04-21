//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

import Foundation

func contains(_ tuples: [(String, Int)], city: String) -> Int {
    for (i, tp) in tuples.enumerated() {
        if tp.0.lowercased() == city.lowercased() {
            return i
        }
    }
    
    return -1
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize > 0 else {
        return cities.count * 5
    }
    
    var result = 0
    var pq: [(city: String, p: Int)] = []
    
    for (i, city) in cities.enumerated() {
        pq.sort { $0.p > $1.p }
        
        let cityTuple = (city, i)
        let index = contains(pq, city: city)
        if index > -1 {
            pq[index] = cityTuple

            result += 1
        } else {
            if pq.count >= cacheSize { //캐시 사이즈를 초과하면 pop
                pq.popLast() //i가 가장 작은 것 pop
            }
            pq.append(cityTuple)

            result += 5
        }
    }
    
    return result
}
