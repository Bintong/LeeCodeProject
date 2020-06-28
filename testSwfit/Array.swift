//
//  Array.swift
//  testSwfit
//
//  Created by BinTong on 2020/6/28.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation
class TBArray: NSObject {
        override init() {
            print("hello tree")
        }
      
        
        
        
    //    209  (7, [2,3,1,2,4,3]
        func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
           var sum = 0
            var left = 0
            var right = 0
            var minLength = 0
            for i in 0..<nums.count {
                sum += nums[i]
                if sum >= s  {
                    right = i + 1
                    minLength = minLength == 0 ? (right - left): min(right  - left,minLength)
                    while left < right && (sum - s - nums[left] >= 0) {
                        sum -= nums[left]
                        left += 1
                        minLength = min(right - left, minLength)
                    }
                }
            }
            return minLength
            
            
        }

}
