//
//  3568.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/21.
//

import Foundation

var input = readLine()!.components(separatedBy: " ")
let defaultType = input[0]

for i in 1..<input.count {
    var result = defaultType
    input[i] = input[i].replacingOccurrences(of: "[]", with: "#")
    let reversedArray = Array(input[i].reversed())
    
    for j in 1..<reversedArray.count {
        let char = reversedArray[j]
        if char == "*" || char == "&" {
            result += String(char)
        } else if char == "#" {
            result += "[]"
        } else {
            result += " \(String(reversedArray[j...].reversed()));"
            break
        }
    }
    
    print(result)
}
