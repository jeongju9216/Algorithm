//
//  2884.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/11.
//

import Foundation

let input = readLine()!.components(separatedBy: " ")

var hour: Int = Int(input[0])!
var min: Int = Int(input[1])!

min -= 45
if min < 0 {
    hour -= 1
    if hour < 0 {
        hour = 23
    }
    
    min = 60 + min
}

print("\(hour) \(min)")
