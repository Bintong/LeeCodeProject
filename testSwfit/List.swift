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
    
//    21. 合并两个有序链表
    
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1
        var l2 = l2
        
        let pHead = ListNode(-1)
        var preN = pHead
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                preN.next = l1
                l1 = l1?.next
            } else {
                preN.next = l2
                l2 = l2?.next
                
            }
            preN = preN.next!
        }
        preN.next = l1 == nil ? l2: l1 //最好 大小不一样
        return pHead.next
        
    }
    
//    24. 两两交换链表中的节点
    
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let second = head?.next
        head?.next = swapPairs(second?.next)
        second?.next = head
        return second
        
    }
//    206. 反转链表 一、迭代法
    func reverseList(_ head: ListNode?) -> ListNode? {
 
        var pre:ListNode?
        var head = head
        while head != nil {
            let next = head?.next
            head?.next = pre
            pre = head;
            head = next
        }
        return pre
    }
    
    //递归
    func reverseList2(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return   head
        }
        // p一直是最后一个非空节点
        let p = self.reverseList2(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
        
        
    }
 
    
//    92. 反转链表 II
    
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard head == nil || head?.next == nil else{
            return head
        }
        
        let res = ListNode(0)
        res.next = head
        var node = res
        for _ in 1..<m {
            node = node.next!
        }
        var nextHead = node.next
        var next = ListNode(0)
        let pre = ListNode(0)
        
        for _ in m..<n {
            next = nextHead?.next! as! ListNode
            nextHead?.next = pre
            nextHead = next
            
            
        }
        node.next?.next = next
        node.next = pre
        return res.next
        
    }
    
}
