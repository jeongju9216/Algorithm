//
//  890.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func createNewPattern(_ str: String) -> String {
        let pattern: [Character] = Array(str)
        var patternDict: [Character: String] = [:]

        var count: Int = 0
        var newPattern: String = ""

        for char in pattern {
            if patternDict[char] == nil {
                count += 1
                if count < 10 {
                    patternDict[char] = "0\(count)"
                } else {
                    patternDict[char] = "\(count)"
                }
            }
            newPattern += patternDict[char]!
        }

        return newPattern
    }

    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var result: [String] = []

        let newPattern: String = createNewPattern(pattern)

        for word in words {
            guard word != pattern else {
                result.append(word)
                continue
            }

            let newWordPattern = createNewPattern(word)

            if newPattern == newWordPattern {
                result.append(word)
            }
        }

        return result
    }
}
