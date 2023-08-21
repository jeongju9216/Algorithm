//
//  1007.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

//함수는 두 점 사이의 거리를 계산
func distance(_ a: (Double, Double), _ b: (Double, Double)) -> Double {
    let dx = a.0 - b.0
    let dy = a.1 - b.1
    return sqrt(dx * dx + dy * dy)
}

//재귀적으로 모든 점들을 고려하여 두 그룹으로 나눈 경우의 최소 벡터 합을 계산합니다.
//각 점을 선택하는 경우와 선택하지 않는 경우를 모두 탐색
func solve(_ points: [(Double, Double)], _ selected: [Bool], _ idx: Int, _ count: Int) -> Double {
    if count == points.count / 2 {
        var sumX = 0.0
        var sumY = 0.0
        
        //새로운 벡터의 x축 요소는 각 원래 벡터의 x축 요소를 더한 값이 되며,
        //y축 요소도 마찬가지로 각 원래 벡터의 y축 요소를 더한 값이 됩니다.
        for i in 0..<points.count {
            //각 점의 x와 y 좌표를 각각 더하거나 뺌
            if selected[i] {
                sumX += points[i].0
                sumY += points[i].1
            } else {
                sumX -= points[i].0
                sumY -= points[i].1
            }
        }

        return distance((sumX, sumY), (0, 0))
    }

    if idx >= points.count {
        return 1e9
    }

    
    var result = solve(points, selected, idx + 1, count)

    var selected = selected
    selected[idx] = true
    result = min(result, solve(points, selected, idx + 1, count + 1))
    selected[idx] = false

    return result
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var points: [(Double, Double)] = []

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Double(String($0))! }
        points.append((input[0], input[1]))
    }

    let selected = Array(repeating: false, count: n)
    print(solve(points, selected, 0, 0))
}
