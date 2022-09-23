//
//  804.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        //알파벳이랑 모스부호 매칭시키기
        let morse: [String] = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var alphabet: [Character: String] = [:]
        var count: Int = 97
        for Morse in morse {
            alphabet[Character(UnicodeScalar(count)!.description)] = Morse
            count += 1
        }

        //word를 모스부호로 바꾸고
        var morseDict: [String: Int] = [:]
        for word in words {
            let arr: [Character] = Array(word)
            var morseString: String = ""
            for char in arr {
                morseString += alphabet[char]!
            }

            //딕셔너리 키로 넣어서 카운트 하기
            morseDict[morseString, default: 0] += 1
        }


        //딕셔너리 value의 카운트

        return morseDict.values.count
    }
}
