//
//  Heap.swift
//  testSwfit
//
//  Created by BinTong on 2020/6/30.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation
class Heap : NSObject {
    override init() {
        print("hello list")
    }
//    347. 前 K 个高频元素
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        
        var dic : [Int: Int] = [:]
        for i in 0..<nums.count {
            var value = 0
            if  dic[nums[i]] != nil {
                value = dic[nums[i]]!
            }
            value += 1
            dic.updateValue(value, forKey: nums[i]) // key  为 数据  value 次数
        }
        
        let stored = dic.sorted{$0.value > $1.value}
   
        if k <= stored.count {
              return stored[0..<k].map{$0.key}
        } else {
            return stored[0..<stored.count].map{$0.key}
        }
    }
        
        
         
         
        
     
}
