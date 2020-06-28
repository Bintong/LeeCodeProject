//
//  StringMethod.swift
//  testSwfit
//
//  Created by BinTong on 2020/6/27.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation
class StringMethod : NSObject {
    override init() {
          print("hello test")
      }
    func checkPermutation(_ s1: String, _ s2: String) ->Bool {
        if s1.count  != s2.count {
            return false
        }
        if s1 == s2  {
            return false
        }
        let new1 = s1.sorted()
        let new2 = s2.sorted()
        if new1 != new2 {
            return false
        } else {
            return true
        }
    }
}
