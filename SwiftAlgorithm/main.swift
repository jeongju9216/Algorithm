//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    func setupCursor(_ number: Int) -> (Int, Int) {
        var cursor = (0,0)
        switch number {
        case 0: cursor = (1,0)
        case 1: cursor = (0,3)
        case 2: cursor = (1,3)
        case 3: cursor = (2,3)
        case 4: cursor = (0,2)
        case 5: cursor = (1,2)
        case 6: cursor = (2,2)
        case 7: cursor = (0,1)
        case 8: cursor = (1,1)
        case 9: cursor = (2,1)
        default: break
        }
        
        return cursor
    }
    
    func addString(number: Int, leftDistance: Int, rightDistance: Int) -> String {
        var string = ""
        switch number {
        case 1, 4, 7:
            string = "L"
        case 3, 6, 9:
            string = "R"
        case 0, 2, 5, 8:
            if leftDistance < rightDistance {
                string = "L"
            } else if leftDistance > rightDistance {
                string = "R"
            } else {
                if hand == "right" {
                    string = "R"
                } else {
                    string = "L"
                }
            }
        default:
            break
        }
        
        return string
    }
    
    var result: String = ""
        
    var leftCursor: (Int, Int) = (0,0)
    var rightCursor: (Int, Int) = (2,0)
    
    for number in numbers {
        let cursor: (Int, Int) = setupCursor(number)
        
        let leftDistance = abs(leftCursor.0 - cursor.0) + abs(leftCursor.1 - cursor.1)
        let rightDistance = abs(rightCursor.0 - cursor.0) + abs(rightCursor.1 - cursor.1)
        
        let string: String = addString(number: number, leftDistance: leftDistance, rightDistance: rightDistance)
        
        result += string
        if string == "R" {
            rightCursor = cursor
        } else {
            leftCursor = cursor
        }
    }

    return result
}

let numbers: [Int] = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hand: String = "left"

print(solution(numbers, hand))
