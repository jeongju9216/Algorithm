//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/22.
//

import Foundation

func splitMelody(_ str: String) -> [String] {
    var inputMusic: [String] = []
    for ch in str { //# 처리
        if ch == "#" {
            let t = inputMusic.popLast()!
            inputMusic.append(t + "#")
        } else {
            inputMusic.append(String(ch))
        }
    }
    return inputMusic
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var infos: [(time: Int, title: String, music: [String])] = []
    
    //멜로디 나누기
    let inputMusic: [String] = splitMelody(m)
    print("inputMusic: \(inputMusic)")
    
    //라디오 음악 정보
    for musicinfo in musicinfos {
        let info = musicinfo.components(separatedBy: ",")
        
        let hour = Int(info[1].prefix(2))! - Int(info[0].prefix(2))!
        let min = Int(info[1].suffix(2))! - Int(info[0].suffix(2))!
        let time = hour * 60 + min //튼 시간
        
        let melodies = splitMelody(info[3])
        // print("melodies: \(melodies)")
        var music: [String] = []
        if time < melodies.count { //음악이 잘린 경우
            music = Array(melodies[0...time])
        } else { //음악 시간을 넘긴 경우
            for _ in 0..<Int(ceil(Double(time)/Double(melodies.count))) {
                music += melodies
            }
        }
        
        infos.append((time, info[2], music))
    }
    infos.sort { $0.time <= $1.time } //튼 시간을 기준으로 정렬
    
    var result = "(None)"
    for info in infos { //포함된 것 체크
        let musicCount = info.music.count
        if musicCount >= inputMusic.count {
            var count = 0
            //m 길이의 만큼 문자열을 잘라 들어있는지 확인한다.
            while musicCount >= inputMusic.count + count {
                let ck = info.music[count..<(inputMusic.count+count)]
                if m == ck.joined() {
                    result = info.title
                    break
                }
                
                count += 1
            }
        }
    }
    
    return result
}
