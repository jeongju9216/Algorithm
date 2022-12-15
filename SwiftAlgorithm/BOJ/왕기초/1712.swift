//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/02.
//
//1712 손익분기점
//21억이므로 반복문으로 해결 불가함
//input[2] - input[1] = 0일 때 발생하는 런타임에러 조심
//import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
if input[1] >= input[2] {
    print(-1)
} else {
    print(input[0] / (input[2] - input[1]) + 1)
}
