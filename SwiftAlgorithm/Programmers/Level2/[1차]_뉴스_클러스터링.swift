//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

import Foundation

let MULTIPLE: Double = 65536.0

func createStrSet(_ strs: [String]) -> [String] {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"

    var results: [String] = []
    for i in 0..<strs.count-1 {
        let ch1 = strs[i].lowercased()
        let ch2 = strs[i+1].lowercased()
        guard alphabet.contains(ch1), alphabet.contains(ch2) else {
            continue
        }
        
        results.append(ch1 + ch2)
    }
    
    return results
}

func createIntersection(_ arr1: [String], _ arr2: [String]) -> [String] {
    var result: [String] = []
    
    var temp = arr2
    for item1 in arr1 {
        for (i, item2) in temp.enumerated() {
            if item1 == item2 {
                temp.remove(at: i)
                result.append(item1)
                break
            }
        }
    }
    
    return result
}

func createUnion(_ arr1: [String], _ arr2: [String]) -> [String] {
    var result: [String] = []
    
    var temp = arr2
    for item1 in arr1 {
        result.append(item1)
        for (i, item2) in temp.enumerated() {
            if item1 == item2 {
                temp.remove(at: i)
                break
            }
        }
    }
    result.append(contentsOf: temp)
    
    return result

}

func solution(_ str1:String, _ str2:String) -> Int {
    var result: Double = 0.0
    
    let str1 = Array(str1).map { String($0) }
    let str2 = Array(str2).map { String($0) }
    
    let str1Arr: [String] = createStrSet(str1)
    let str2Arr: [String] = createStrSet(str2)
    
    var intersection: [String] = createIntersection(str1Arr, str2Arr) //교집합
    var union: [String] = createUnion(str1Arr, str2Arr) //합집합
    
    // print("intersection: \(intersection)")
    // print("union: \(union)")
    
    if intersection.isEmpty && union.isEmpty {
        result = 1.0
    } else {
        result = Double(intersection.count) / Double(union.count)
    }
    
    return Int(floor(result * MULTIPLE))
}

//J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.
//O(N^2)
