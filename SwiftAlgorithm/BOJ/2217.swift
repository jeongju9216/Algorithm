//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/15.
//

//2217 로프
import Foundation

//여러 개로 나눴을 때는 로프 배열 최소값
//가장 큰 로프가 나눠서 든 거보다 많이 들 수 있으면 1개만

//역순으로 정렬
//들 수 있는 무게 체크
//최대값 저장

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

var result = 0
for i in 0..<arr.count {
    result = max(result, arr[i] * (i + 1))
}

print(result)
