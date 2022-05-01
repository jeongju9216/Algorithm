//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/01.
//

import Foundation

func convertSec(_ time: String) -> Int {
    let times = time.split { $0 == ":" }.map { Int($0)! }
    return times[0] * 3600 + times[1] * 60 + times[2]
}

func convertTime(_ sec: Int) -> String {
    let hour = sec / 3600
    let min = (sec % 3600) / 60
    let sec = (sec % 3600 % 60)
    
    return String(format: "%02d:%02d:%02d", hour, min, sec)
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    var result = ""
    
    let playSec = convertSec(play_time) //초로 변환
    // print("playSec: \(playSec)")
    var counts: [Double] = Array(repeating: 0, count: playSec+1) //시청자 수 배열
    
    let advSec = convertSec(adv_time) ////초로 변환
    // print("advSec: \(advSec)")
    
    for log in logs {
        let times = log.components(separatedBy: "-")
        let start = convertSec(times[0])
        let end = convertSec(times[1])
        
        //시청자 수 계산 방법 -> 모든 로그에 대해 반복문을 돌리면 시간 초과
        //시작과 끝에 표시하고 반복 한 번에 계산 가능
        counts[start] += 1
        counts[end] -= 1
    }
    
    //들어오면 +1, 나가면 -1로 앞의 원소를 더하면 계산이 된다.
    for i in 1..<counts.count {
        counts[i] += counts[i-1]
    }
    
    var sum: Double = counts[0..<advSec].reduce(0, +)
    var maxSum: Double = sum
    result = convertTime(0)
    // print("time: \(result) / maxSum: \(maxSum)")
    for i in 0..<(counts.count-advSec) {
        sum = sum - counts[i] + counts[i+advSec] //앞에 하나 빼주고 뒤에 하나 넣어주고 -> Queue의 원리
        if sum > maxSum {
            maxSum = sum
            result = convertTime(i + 1) //지금 시작은 i+1임
            // print("sec: \(i) / time: \(result) / maxSum: \(maxSum)")
        }
    }
    
    return result
}
