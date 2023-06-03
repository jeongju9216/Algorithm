//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/18.
//

import Foundation

let MULTIPLE: Double = 65536.0

func createStrArray(_ str: String) -> [String] {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let str = Array(str).map { String($0) }
    
    var results: [String] = []
    for i in 0..<str.count-1 {
        let ch1 = str[i].lowercased()
        let ch2 = str[i+1].lowercased()
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
    arr1.forEach {
        if let index = temp.firstIndex(of: $0) {
            temp.remove(at: index)
            result.append($0)
        }
    }
    
    return result
}

func createUnion(_ arr1: [String], _ arr2: [String]) -> [String] {
    var result: [String] = []
    
    var temp = arr2
    arr1.forEach {
        if let index = temp.firstIndex(of: $0) {
            temp.remove(at: index)
        }
    }
    result.append(contentsOf: arr1)
    result.append(contentsOf: temp)
    
    return result

}

func solution(_ str1:String, _ str2:String) -> Int {
    var result: Double = 1.0
    
    let str1Arr: [String] = createStrArray(str1)
    let str2Arr: [String] = createStrArray(str2)
    
    let intersection: [String] = createIntersection(str1Arr, str2Arr) //교집합
    let union: [String] = createUnion(str1Arr, str2Arr) //합집합
    
    if !(intersection.isEmpty && union.isEmpty) {
        result = Double(intersection.count) / Double(union.count)
    }
    
    return Int(floor(result * MULTIPLE))
}

//J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.
//O(N^2)
