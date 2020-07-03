//
//  main.swift
//  test
//
//  Created by BinTong on 2020/6/26.
//  Copyright © 2020 Tongbin. All rights reserved.
//

import Foundation

print("Hello, World!")

enum Rank:Int {
    case ace = 1
    case two, three,four,five,six,seven,eight,nine,ten
    case jack , queue,king
    
    
    
    func simpleDescription() -> String {
        switch self  {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queue:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

print(ace)
print(aceRawValue)

enum Suit {
    case spades,heart,diamonds,clubs
    func simpleDesc() -> String {
        switch self {
        case .spades:
            return "spades"
        case .heart:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
            
            
        }
    }
    func color() -> String {
        switch self {
        case .spades ,.clubs:
            return "black"
        case .heart ,.diamonds:
            return "red"
        }
        
    }
}


let hearts = Suit.heart
let headDesc = hearts.simpleDesc()

let heartsC = hearts.color()

print(heartsC)


enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")


switch  success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure...  \(message)")
}


//----------------- struct ---------------//
//----------------- struct ---------------//
//----------------- struct ---------------//
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDesc() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDesc())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let desc = threeOfSpades.simpleDesc()
print(desc)


//----------------- 协议和扩展 ---------------//
//----------------- 协议和扩展 ---------------//
//----------------- 协议和扩展 ---------------//

protocol ExampleProtocol {
    var simpleDescription: String{get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
    
}

var a = SimpleClass()
a.adjust()
let aDesc = a.simpleDescription
print(aDesc)

extension Int: ExampleProtocol{
    mutating func adjust() {
        self += 42
    }
    
    var simpleDescription: String {
        return "the number  \(self)"
    }
}
print(7.simpleDescription)

let protocolValue : ExampleProtocol = a //class
print(protocolValue.simpleDescription)

enum PrinterError:Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job:Int, toPrinter printerName:String) throws -> String {
    if printerName == "Never Has Toner" {
        
        throw PrinterError.noToner
    }
    return "Job sent"
}
//泛型

func makeArray<Item>(repeating item:Item, numberOfTimes:Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let arrayMake = makeArray(repeating: "knock", numberOfTimes: 4)
print(arrayMake)

enum OptionValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionValue<Int> = .none
possibleInteger = .some(100)




 
class Solotion {
//    102. 二叉树的层序遍历
    func levelOrder(_ root: TreeNode?) -> [
        [Int]] {
            
            guard root != nil else {
                return []
            }
            var res = [[Int]]()
            var nodes = [TreeNode]()
            
            nodes.append(root ?? TreeNode(0))
            var flag = true
            while nodes.count > 0 {
                var arr = [TreeNode]()
                var temp = [Int]() //一维 数组
                for i in 0..<nodes.count {
                    if flag {
                        let node = nodes[i]
                        temp.append(node.val)
                    } else {
                        print("\(nodes.count) + \(i)")
                        let node = nodes[nodes.count - i - 1] //倒叙
                        temp.append(node.val)
                    }
                    let node = nodes[i]
                    if node.left != nil {
                        arr.append(node.left!)
                    }
                    if node.right != nil {
                        arr.append(node.right!)
                    }
                }
                res.append(temp)
                nodes = arr
                flag = !flag

            }
            return res
    }
//    剑指 Offer 32 - I. 从上到下打印二叉树
    func levelOrder1(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int]()
        var nodes = [TreeNode]()
        nodes.append(root ?? TreeNode(0))
        
        while nodes.count > 0 {
            var arr = [TreeNode]()
            for i  in 0..<nodes.count {
                let node = nodes[i]
                res.append(node.val)
                
                if node.left != nil {
                    arr.append(node.left!)
                }
                if node.right != nil {
                    arr.append(node.right!)
                }
            }
            nodes = arr //换层
        }
        return res
    }
}

let c = Solotion()
let node1 = TreeNode(3)
let node2 = TreeNode(9)
let node3 = TreeNode(20)
let node4 = TreeNode(15)
let node5 = TreeNode(7)

node1.left = node2
node1.right = node3
node3.left = node4
node3.right = node5

 

let arr_tree = c.levelOrder(node1)
print(arr_tree)
let arr_tree2 = c.levelOrder1(node1)
print(arr_tree)
print(arr_tree2)

let test = Test()

let strM = StringMethod()
let isE =  strM.checkPermutation("123", "231")
print(isE)


let treeE = TreeMethod()
let node_m_1 = Node(3)
let node_m_2 = Node(9)
let node_m_3 = Node(20)
let node_m_4 = Node(15)
let node_m_5 = Node(7)
let node_m_6 = Node(2)
let node_m_8 = Node(12)

 
node_m_1.children = [node_m_2, node_m_3]
node_m_3.children = [node_m_4, node_m_5]
node_m_4.children = [node_m_6, node_m_8]
let deepNum = treeE.maxDepth(node_m_1)
print(deepNum)
let deepNum1 = treeE.maxDepth2(node1)
print(deepNum1)
let inTree = treeE.inverTree(node1)
print(inTree ?? "")
let str_tree = "1,2,3,4,5"
let inorderTree = treeE.serialize(node1)
print(inorderTree)

//array
let arrtb = TBArray()
let length123 = arrtb.minSubArrayLen(7, [2,3,1,2,4,3])
print(length123)


// list
let listNode1 = ListNode(1)
let listNode2 = ListNode(2)
let listNode3 = ListNode(3)
let listNode4 = ListNode(4)
let listNode5 = ListNode(5)
let listNode6 = ListNode(6)

listNode1.next = listNode2
listNode2.next = listNode3
listNode3.next = listNode4
listNode4.next = listNode5
listNode5.next = listNode6
let list = List()

let  list456 = list.swapPairs(listNode1)
print(list456)
let resNode = list.removeNthFromEnd(listNode1, 2)
 




// list
let list1Node1 = ListNode(11)
let list1Node2 = ListNode(23)
let list1Node3 = ListNode(23)
let list1Node4 = ListNode(24)
let list1Node5 = ListNode(53)
let list1Node6 = ListNode(55)

list1Node1.next = list1Node2
list1Node2.next = list1Node3
list1Node3.next = list1Node4
list1Node4.next = list1Node5
list1Node5.next = list1Node3

let deNode = list.detectCycle(list1Node1)
print(deNode)

let  list123 = list.mergeTwoLists(list1Node1, listNode1)
print(list123)




let heap = Heap()
let heapTopK = heap.topKFrequent([1,1,1,1,1,1,1,2,2,3], 4)
print(heapTopK)

let num123 = Number()
let res123 = num123.threeSum([1,2,3,4,5,6,-1,-2,-4,5,9])
print(res123)


let res456 = num123.search([4,5,6,7,0,1,2], 3)
print(res456)
let res23 = num123.search1([-1,0,3,5,9,12],9)
print(res23)



//动态规划
let dp = DProgramming()
let subStr =   dp.longestPalindrome("ac")
print(subStr)
