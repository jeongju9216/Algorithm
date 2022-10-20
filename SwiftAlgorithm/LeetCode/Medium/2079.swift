//
//  2079.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/19.
//

import Foundation

class Solution {
    func wateringPlants(_ plants: [Int], _ capacity: Int) -> Int {
        
        //배열 순회하면서 원소가 0보다 큰지 확인 (이동하면서 스텝 + 1)
        //0보다 크면 물을 줌
        //0이 되면 다음 원소로 이동 (스텝 + 1)
        //바구니가 0이 되면 스텝 += (index + 1)
        
        var plants = plants
        
        var water: Int = 0
        var step: Int = 0
        
        var index: Int = 0
        while index < plants.count { //마지막 식물까지 다 줄 때까지
            //물이 없거나 다 못 주면
            if water == 0 || water < plants[index] {
                water = capacity
                step += index
                
                //index까지 이동하기
                step += (index + 1)
            } else { //아니면 바로 다음꺼로 이동
                step += 1
            }
            
            //물을 다 줄 때까지
            while plants[index] > 0 {
                //현재 물로 다 줄 수 있으면
                if plants[index] <= water {
                    water -= plants[index]
                    plants[index] = 0
                } else { //다 못 주면
                    plants[index] -= water
                    water = capacity
                    step += index

                    //index까지 이동하기
                    step += (index + 1)
                }
            }
            
            index += 1
        }
        
        return step
    }
}
