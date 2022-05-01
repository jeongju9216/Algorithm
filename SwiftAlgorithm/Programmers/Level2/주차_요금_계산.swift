//
//  주차_요금_계산.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/01.
//

import Foundation

func strToMin(_ str: String) -> Int {
    let time = str.split { $0 == ":" }.map { Int(String($0))! }
    return time[0] * 60 + time[1]
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var result: [Int] = []
    
    let lastTime = strToMin("23:59")
    // print("lastTime: \(lastTime)")
    var cars: [String: [Int]] = [:]
    
    //차 기록 세팅
    for record in records {
        let record = record.components(separatedBy: " ")
        
        let min = strToMin(record[0])
        let number = record[1]
        
        if let _ = cars[number] {
            cars[number]?.append(min)
        } else {
            cars[number] = [min]
        }
    }
    
    cars.forEach {
        let key = $0.key
        
        //입차 기록만 있으면 23:59에 출차 처리
        if $0.value.count % 2 != 0 {
            cars[key]?.append(lastTime)
        }
        
        //총 주차 시간 구하기
        var minSum = 0, minNums = cars[key]!
        for i in 0..<minNums.count {
            if i % 2 != 0 {
                minSum += (minNums[i] - minNums[i-1] )
            }
        }
        
        //비용 구하기
        var cost = fees[1]
        if minSum > fees[0] {
            cost = cost + (Int(ceil(Double(minSum - fees[0]) / Double(fees[2]))) * fees[3])
        }

        cars[key] = [cost]
    }
    
    //차량 번호 순서로 비용 넣기
    cars.keys.sorted().forEach {
        result.append(cars[$0]![0])
    }
    
    return result
}
//records의 원소들은 시각을 기준으로 오름차순으로 정렬
//마지막 시각(23:59)에 입차되는 경우는 입력으로 주어지지 않습니다.
//입차된 차량이 다음날 출차되는 경우는 입력으로 주어지지 않습니다.

//홀수 index = In 짝수는 Out
