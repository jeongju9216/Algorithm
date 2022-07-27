//
//  1603.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class ParkingSystem {
    
    private var big: Int
    private var medium: Int
    private var small: Int
    
    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.big = big
        self.medium = medium
        self.small = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        switch carType {
            case 1:
                guard big > 0 else { return false }
                
                big -= 1
                return true
            case 2:
                guard medium > 0 else { return false }
                
                medium -= 1
                return true
            case 3:
                guard small > 0 else { return false }
                
                small -= 1
                return true
            default: return false
        }
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * let obj = ParkingSystem(big, medium, small)
 * let ret_1: Bool = obj.addCar(carType)
 */
