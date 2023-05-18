//
//  10101.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

let angle1 = Int(readLine()!)!
let angle2 = Int(readLine()!)!
let angle3 = Int(readLine()!)!

let sum = angle1 + angle2 + angle3

if sum != 180 {
    print("Error")
} else {
    if angle1 == 60 && angle2 == 60 && angle3 == 60 {
        print("Equilateral")
    } else if angle1 == angle2 || angle2 == angle3 || angle3 == angle1 {
        print("Isosceles")
    } else if angle1 != angle2 || angle2 != angle3 {
        print("Scalene")
    }
}
