//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result: String = ""
        
    let isRight = (hand == "right")
    
    var leftCursor: (Int, Int) = (0,0)
    var rightCursor: (Int, Int) = (2,0)
    
    for number in numbers {
        switch number {
        case 1, 4, 7:
            result += "L"
            if number == 1 {
                leftCursor = (0,3)
            } else if number == 4 {
                leftCursor = (0,2)
            } else if number == 7 {
                leftCursor = (0,1)
            }
        case 3, 6, 9:
            result += "R"
            if number == 3 {
                rightCursor = (2,3)
            } else if number == 6 {
                rightCursor = (2,2)
            } else if number == 9 {
                rightCursor = (2,1)
            }
        case 0, 2, 5, 8:
            var cursor: (Int, Int) = (1,0)
            if number == 2 {
                cursor = (1,3)
            } else if number == 5 {
                cursor = (1,2)
            } else if number == 8 {
                cursor = (1,1)
            }
            
            let leftDistance = abs(leftCursor.0 - cursor.0) + abs(leftCursor.1 - cursor.1)
            let rightDistance = abs(rightCursor.0 - cursor.0) + abs(rightCursor.1 - cursor.1)
            
            if leftDistance < rightDistance {
                result += "L"
                leftCursor = cursor
            } else if leftDistance > rightDistance {
                result += "R"
                rightCursor = cursor
            } else {
                if isRight {
                    result += "R"
                    rightCursor = cursor
                } else {
                    result += "L"
                    leftCursor = cursor
                }
            }
            
            
        default:
            break
        }
    }

    return result
}

let numbers: [Int] = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hand: String = "left"

print(solution(numbers, hand))
