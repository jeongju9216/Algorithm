//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/02.
//
//1330 두 수 비교하기
//import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
if input[0] > input[1] {
    print(">")
} else if input[0] < input[1] {
    print("<")
} else {
    print("==")
}
