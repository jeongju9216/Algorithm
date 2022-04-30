//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/30.
//

import Foundation

func makeOrder(_ string: [String], _ length: Int) -> [String] {
    var order: [String] = []
    
    func combination(_ index: Int, _ current: String) {
        if current.count == length {
            order.append(current)
            return
        } else {
            for i in index..<string.count {
                combination(i+1, current + String(string[i]))
            }
        }
    }
    
    combination(0, "")
    
    return order
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // let orders = ["ABCD", "ABCD", "ABCD"]
    // let course = [2,3,4]
    
    var result: [String] = []
    
    let courseRange = (course.first!...course.last!)
    
    var orderCombinations: [Int:[String]] = [:]
    courseRange.forEach { orderCombinations[$0] = [] }
    
    orders.forEach { order in
        let orderArr = Array(order).sorted(by: <).map { String($0) }
        
        courseRange.forEach {
            let orderCombination = makeOrder(orderArr, $0)
            for od in orderCombination {
                orderCombinations[$0]?.append(od)
            }
        }
    }
    // print("orderCombinations: \(orderCombinations)")
    
    var orderCount: [String: Int] = [:]
    courseRange.forEach { i in
        for order in orderCombinations[i]! {
            orderCount[order] = (orderCount[order] ?? 0) + 1
        }
    }
    // print("orderCount: \(orderCount)")
    
    var maxCounts: [Int: Int] = [:]
    courseRange.forEach { maxCounts[$0] = 0 }
    orderCount.forEach  {
        maxCounts[$0.key.count] = max(maxCounts[$0.key.count]!, $0.value)
    }
    print("maxCounts: \(maxCounts)")
    
    for order in orderCount {
        if course.contains(order.key.count) {
            if let maxCount = maxCounts[order.key.count],
                order.value > 1, order.value == maxCount {
                result.append(order.key)
            }
        }
    }
    result.sort(by: <)
    print("result: \(result)")
    
    return result
}
//1. 각 order의 부분 조합 구하기
//2. 조합 딕셔너리로 생성하기 -> 주문:횟수
//이미 존재하면 + 1, 아니면 1로 생성
//3. 각 course 길이인 key 뽑아서 최대 횟수 구함.
//4. 최대인 조합 찾기 -> 횟수가 같으면 다 ㄱㄱ


//코스요리 메뉴는 최소 2가지 이상의 단품메뉴로 구성
//최소 2명 이상의 주문된 단품메뉴 조합에 대해서만 코스요리 메뉴 후보에 포함

//각 손님은 단품메뉴를 2개 이상 주문해야 함
//각 단품메뉴는 A ~ Z의 알파벳 대문자로 표기
