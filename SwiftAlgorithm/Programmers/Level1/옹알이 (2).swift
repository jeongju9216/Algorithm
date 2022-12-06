//
//  옹알이 (2).swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    let set: Set<String> = ["aya", "ye", "woo", "ma"]
    
    var result: Int = 0
    
    for str in babbling {
        var stack: [Character] = [] //지금 발음 중인거
        var tmp: String = "" //이전에 발음한 거
        
        let chars: [Character] = Array(str)
        if chars.count < 2 {
            continue
        }
        
        for char in chars {
            stack.append(char)
            guard stack.count >= 2 else { //최소 발음 글자가 2
                continue
            }
            
            let word = String(stack)
                
            if word == tmp { //연속 발음 겹침
                break
            }

            if set.contains(word) { //발음할 수 있는 단어라면
                tmp = word
                stack = []
            }
        }
        
        if stack.isEmpty {
            result += 1
        }
    }
    
    return result
}
