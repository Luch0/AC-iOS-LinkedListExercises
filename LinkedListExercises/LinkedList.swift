//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T> {
    var key: T
    var next: Node?
    init(key: T) {
        self.key = key
    }
}

public class LinkedList<T: Comparable> {
    var head: Node<T>?
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {
        var length = 0
        var currentNode = head
        while currentNode != nil {
            length += 1
            currentNode = currentNode?.next
        }
        return length
    }
    
    func append(element newKey: T) {
        if head == nil {
            let newHead = Node(key: newKey)
            head = newHead
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        let newNode = Node(key: newKey)
        currentNode?.next = newNode
    }
    
    func getNode(at index: Int) -> Node<T>? {
        var currentNode = head
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.key == targetKey {
                return true
            }
            currentNode = currentNode?.next
        }
        return false
    }

    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNode = head //checks first lists head
        var otherListNode = otherList.head // check other list head
        while currentNode != nil || otherListNode != nil {
            if currentNode?.key != otherListNode?.key {
                return false
            }
            currentNode = currentNode?.next
            otherListNode = otherListNode?.next
        }
        return true
        
    }
    func toArr() -> [T] {
        var newArr = [T]()
        var currentNode = head
        while currentNode != nil {
            newArr.append((currentNode?.key)!)
            currentNode = currentNode?.next
        }
        return newArr
    }
    
    func reversed() -> LinkedList<T> {
        var newArr = [T]()
        var currentNode = head
        while currentNode != nil {
            newArr.append((currentNode?.key)!)
            currentNode = currentNode?.next
        }
        newArr = newArr.reversed()
        let resultLinkedList = LinkedList()
        for key in newArr {
            resultLinkedList.append(element: key)
        }
        return resultLinkedList
    }
    
    func removeAll() {
        head = nil
    }
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {
        var currentNode = head
        let linkedList = LinkedList()
        while currentNode != nil {
            if !linkedList.contains(element: (currentNode?.key)!) {
                linkedList.append(element: currentNode!.key)
            }
            currentNode = currentNode?.next
        }
        self.head = linkedList.head
    }
    
    static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        let returnLinkList = LinkedList()
        var listOneCurrentNode = listOne.head
        var listTwoCurrentNode = listTwo.head
    
        while listOneCurrentNode != nil || listTwoCurrentNode != nil {
            
            if listOneCurrentNode == nil && listTwoCurrentNode != nil {
                while listTwoCurrentNode != nil {
                    returnLinkList.append(element: (listTwoCurrentNode?.key)!)
                    listTwoCurrentNode = listTwoCurrentNode?.next
                }
                return returnLinkList
            }
            if listOneCurrentNode != nil && listTwoCurrentNode == nil {
                while listOneCurrentNode != nil {
                    returnLinkList.append(element: (listOneCurrentNode?.key)!)
                    listOneCurrentNode = listOneCurrentNode?.next
                }
                return returnLinkList
            }
            if listOneCurrentNode!.key < listTwoCurrentNode!.key {
                returnLinkList.append(element: (listOneCurrentNode?.key)!)
                listOneCurrentNode = listOneCurrentNode?.next
            } else {
//            if listOneCurrentNode!.key > listTwoCurrentNode!.key {
                returnLinkList.append(element: (listTwoCurrentNode?.key)!)
                listTwoCurrentNode = listTwoCurrentNode?.next
            }
        }
        return returnLinkList
    }
    
    


}

