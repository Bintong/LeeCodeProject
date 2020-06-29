//
//  List.swift
//  testSwfit
//
//  Created by BinTong on 2020/6/28.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class List : NSObject {
    override init() {
            print("hello list")
        }
    
//    19. 删除链表的倒数第N个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let prev : ListNode? = ListNode(0)
        prev?.next = head
        var low = prev
        var high = prev
        for _ in 0..<n {
            high = high?.next //快的一直往前走
        }
        
        while high?.next  != nil {
            low = low?.next
            high = high?.next
        }
        
        low?.next = low?.next?.next
        return prev?.next //返回的是链表 不是删除 的数据
    }
    

    //    02.08. 环路检测
    
    func  detectCycle(_ head: ListNode?) -> ListNode? {
//    slow走了n圈的环，所以只要再走a步就可以到环形入口节点
        var fast = head, slow = head
        repeat {
            if fast == nil || slow == nil {
                return nil
            }
            fast = fast?.next?.next
            slow = slow?.next
            
        }while fast !== slow
        
        fast = head
        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }
        return fast
        
    }
    
}
