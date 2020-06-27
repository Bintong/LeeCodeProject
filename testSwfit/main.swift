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

//TreeNode node1 = new TreeNode(1);
//        TreeNode node2 = new TreeNode(2);
//        TreeNode node3 = new TreeNode(3);
//        TreeNode node4 = new TreeNode(4);
//        TreeNode node5 = new TreeNode(5);
//        node1.left = node2;
//        node1.right = node3;
//        node2.left = node4;
//        node2.right = node5;
 

let arr_tree = c.levelOrder(node1)
print(arr_tree)

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

let inTree = treeE.inverTree(node1)
print(inTree ?? "")
let str_tree = "1,2,3,4,5"
let inorderTree = treeE.serialize(node1)
print(inorderTree)

