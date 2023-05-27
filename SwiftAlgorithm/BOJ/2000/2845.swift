//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/08/25.
//

//2845 파티가 끝나고 난 뒤
//수학, 구현, 사칙연산
//todo 시간 미세하게나마 더 줄일 수 있음!
//import Foundation

let exactPeopleCount : Int = {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    return input[0] * input[1]
}()
print(readLine()!.split(separator: " ").map { String(Int(String($0))! - exactPeopleCount) }.joined(separator: " "))
