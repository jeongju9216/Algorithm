//
//  섬_연결하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/05.
//

import Foundation

//크루스칼 알고리즘
var parents: [Int] = []

func isCycle(left: Int, right: Int) -> Bool { //사이클 확인
    return parents[left] == parents[right]
}

func findParent(_ child: Int) -> Int { //부모 찾기
    guard parents[child] == child else {
        return findParent(parents[child])
    }
    
    return child
}

func connectBridge(left: Int, right: Int) { //다리 연결
    //부모 합치기
    changeParent(oldParent: findParent(right), newParent: findParent(left))
}

func changeParent(oldParent: Int, newParent: Int) {
    //오래된 부모를 가진 자식 구하기
    let childs = (0..<parents.count).filter { parents[$0] == oldParent }
    for child in childs { //부모 바꾸기
        parents[child] = newParent
    }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    parents = (0..<n).map { $0 }
    
    //cost를 기준으로 정렬
    let sortedCosts = costs.sorted { $0[2] < $1[2] }
    
    var sum = 0
    for bridge in sortedCosts {
        let left = bridge[0], right = bridge[1]
        let cost = bridge[2]
        if !isCycle(left: left, right: right) {
            connectBridge(left: left, right: right)
            sum += cost
        }
    }
    
    return sum
}
