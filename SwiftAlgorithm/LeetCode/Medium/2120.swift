//
//  2120.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {

        let length = s.count

        var result: [Int] = []
        for i in 0..<length {
            var startPos = startPos
            let newCommand: [Character] = Array(Array(s)[i...])

            var count: Int = 0
            for command in newCommand {
                switch command {
                case "U":
                    startPos[0] -= 1
                case "D":
                    startPos[0] += 1
                case "R":
                    startPos[1] += 1
                case "L":
                    startPos[1] -= 1
                default: break
                }

                guard (0..<n) ~= startPos[0] && (0..<n) ~= startPos[1] else {
                    break
                }

                count += 1
            }

            result.append(count)
        }

        return result
    }
}
