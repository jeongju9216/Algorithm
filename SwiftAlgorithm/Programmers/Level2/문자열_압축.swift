//
//  문자열압축.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/05.
//

import Foundation

func solution(_ s:String) -> Int {
    if s.count <= 2 {
        return s.count
    }
    
    var result: Int = 0
    for unit in (1...(s.count/2)) { //자르는 단위
        // print("--- \(unit) ---")
        let slicingStrings = slicing(str: s, unit: unit)
        let compressingString = compress(slicingStrings)
        
        result = (result > 0) ? min(result, compressingString.count) : compressingString.count
    }
    
    return result
}

func slicing(str: String, unit: Int) -> [String] {
    
    let strings = Array(str)
    let length = strings.count
    
    var words: [String] = []
    for i in stride(from: unit-1, to: length, by: unit) {
        let word = strings[(i-unit+1)...i].map{ String($0) }.joined()
        words.append(word)
    }
    
    if length % unit > 0 {
        words.append(String(strings[(length - length%unit)...]))
    }
    
    // print("words: \(words)")
    return words
}

func compress(_ strings: [String]) -> String {
    let length = strings.count
    var string = ""
    var count = 1
    for i in 0..<(length-1) {
        if strings[i] == strings[i+1] {
            count += 1
        } else {
            let addString = (count > 1) ? ("\(count)\(strings[i])") : ("\(strings[i])")
            string += addString
            
            count = 1
        }
    }
    
    let addString = (count > 1) ? ("\(count)\(strings[length-1])") : ("\(strings[length-1])")
    string += addString
    
    // print("compress: \(string)")
    return string
}
