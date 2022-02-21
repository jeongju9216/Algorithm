//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/02.
//
//1297 TV 크기
//가로^2 + 세로^2 = 대각선^2
//대각선^2 = (가로비율 * x)^2 + (세로비율 * x)^2
//x = (대각선^2 / (가로비율^2 + 세로비율^2))의 제곱근
//result = x * 가로비율, x * 세로비율
//sqrt()보다 pow(OOO, 0.5)가 더 빠르다
import Foundation

let input = readLine()!.split(separator: " ").map { Double(String($0))! }
let x = pow(pow(input[0], 2) / (pow(input[1], 2) + pow(input[2], 2)), 0.5)
print(Int(floor(x * input[1])), Int(floor(x * input[2])))
