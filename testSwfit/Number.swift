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
    
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        //队伍的头部 和尾部的指针
        var left = 0
        var right = nums.count - 1
        
        let f = nums.first!
        while left <= right {
            let mid = left + (right - left)/2 // 中间指针
           
            let midValue = nums[mid] //中间值
            if midValue == target {
                return mid
            } else if midValue < target { //中间值 小于 目标 右边在
                if target < f {  // 目标值 小于第一个
                    left = mid + 1
                } else { //目标值 大于第一个
                    if midValue < f {
                        right = mid - 1
                    } else {
                        left  = mid + 1
                    }
                }
            } else {
                if target < f {
                    if midValue < f {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
        
    }
//    704二分查找
    func search1(_ nums: [Int], _ target: Int) -> Int {
        var head = 0
        var tail = nums.count - 1
        while head <= tail {
            let mid = (head + tail)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                tail = mid - 1
            } else {
                head = mid + 1
            }
        }
        return -1
    }
    
    
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
