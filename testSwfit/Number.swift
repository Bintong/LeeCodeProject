//
//  Number.swift
//  testSwfit
//
//  Created by BinTong on 2020/7/1.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation
class Number : NSObject {
    override init() {
          print("hello Number")
      }
    
    
//    33. 搜索旋转排序数组
    //二分法搜索
    
    
//   15. 三数之和
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 2 {
            return []
        }
        
        var reslt : [[Int]] = []
        let  sort:[Int] = nums.sorted()
        for i in 0..<sort.count - 1 {
            var low : Int = i + 1
            var high: Int = sort.count - 1
            let target : Int = 0 - sort[i]
            if i > 0 && sort[i] == sort[i-1] {
                continue
            }
            
            while low < high {
                let sum: Int = sort[low] + sort[high]
                if sum == target {
                    reslt.append([sort[low], sort[high], sort[i]])
                    while low < high && sort[low] == sort[low + 1] {
                        low += 1
                    }
                    while low < high && sort[high] == sort[high - 1]{
                        high -= 1
                    }
                    low += 1
                    high -= 1
                } else if sum < target {
                    low += 1
                } else {
                    high -= 1
                }
            }
        }
        return reslt
    }
}
