//
//  20436.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

let leftKeyboard: [String: (Int, Int)] = [
    "q": (0, 0), "w": (0, 1), "e": (0, 2), "r": (0, 3),
    "t": (0, 4),
    "a": (1, 0), "s": (1, 1), "d": (1, 2), "f": (1, 3),
    "g": (1, 4),
    "z": (2, 0), "x": (2, 1), "c": (2, 2), "v": (2, 3)
]

let rightKeyboard: [String: (Int, Int)] = [
    "y": (0, 5), "u": (0, 6), "i": (0, 7),
    "o": (0, 8), "p": (0, 9),
    "h": (1, 5), "j": (1, 6), "k": (1, 7),
    "l": (1, 8),
    "b": (2, 4), "n": (2, 5), "m": (2, 6),
]

let input = readLine()!.components(separatedBy: " ")
let target = Array(readLine()!).map { String($0) }

var left = leftKeyboard[input[0]]!, right = rightKeyboard[input[1]]!
var result = 0
for str in target {
    //left
    if let nextPoint = leftKeyboard[str] {
        let dist = abs(nextPoint.0 - left.0) + abs(nextPoint.1 - left.1)
        result += dist
        left = nextPoint
    }
    
    //right
    if let nextPoint = rightKeyboard[str] {
        let dist = abs(nextPoint.0 - right.0) + abs(nextPoint.1 - right.1)
        result += dist
        right = nextPoint
    }
    
    result += 1
}

print(result)
