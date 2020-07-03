//
//  DProgramming.swift
//  testSwfit
//
//  Created by BinTong on 2020/7/2.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation

//动态规划
class DProgramming : NSObject {
    override init() {
        print("hello DProgramming")
    }
//    5. 最长回文子串
    func longestPalindrome(_ s: String) -> String {
      
        guard s.count > 1 else {
            return s
        }
        
        
        
        let characters = Array(s)
        var maxCount = 0
        var maxStartIndex = 0
        var maxEndIndex = 0
        var signArray = [[Bool]]()
        if ( s.count == 2 ) {
            if characters[0] == characters[1] {
                return s
            } else {

                let sub1 = s.index(s.startIndex, offsetBy: maxStartIndex)
                let sub2 = s.index(s.startIndex, offsetBy: maxEndIndex)
                return String(s[sub1...sub2])
            }
            
        }
        var tmpDp = [Bool]()
        for _ in 0..<s.count {
            tmpDp.append(false)
        }
        for _ in 0..<s.count {
            signArray.append(tmpDp) //二维数组表
        }
        
        for r in 0..<s.count {
            
            for l in 0..<r {
//                如果s[i] == s[j]s[i]==s[j]那么说明只要dp[i+1][j-1]dp[i+1][j−1]是回文子串，那么是dp[i][j]dp[i][j]也就是回文子串
//                如果s[i]\ne s[j]s[i]
//
//
//                 =s[j]那么说明dp[i][j]dp[i][j]必定不是回文子串。
                if (characters[r] == characters[l]) && (( r - l ) <= 2 || signArray[1 + l][r - 1]) {
                    signArray[l][r] = true
                    if (r - l + 1) > maxCount {
                        maxCount = r - l + 1
                        maxStartIndex = l
                        maxEndIndex = r
                    }
                }
            }
        }
        
        
        let sub1 = s.index(s.startIndex, offsetBy: maxStartIndex)
        let sub2 = s.index(s.startIndex, offsetBy: maxEndIndex)
        return String(s[sub1...sub2])
    }
}
