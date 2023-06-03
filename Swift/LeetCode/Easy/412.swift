//
//  412.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/08.
//

import Foundation

enum Word: String {
    case Fizz, Buzz, FizzBuzz
}

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result: [String] = []
        for i in 1...n {
            var item: String = "\(i)"
            if i % 3 == 0 && i % 5 == 0 {
                item = Word.FizzBuzz.rawValue
            } else if i % 3 == 0 {
                item = Word.Fizz.rawValue
            } else if i % 5 == 0 {
                item = Word.Buzz.rawValue
            }
            
            result.append(item)
        }
                
        return result
    }
}

