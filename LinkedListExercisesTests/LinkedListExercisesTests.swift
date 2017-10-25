//
//  LinkedListExercisesTests.swift
//  LinkedListExercisesTests
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import XCTest
@testable import LinkedListExercises

class LinkedListExercisesTests: XCTestCase {
    
    var myList = LinkedList<Int>()
    var myCopy = LinkedList<Int>()
    var emptyList = LinkedList<Int>()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        myList.head = Node(key: 10)
        myList.insert(nodeWithKey: 20, at: 1)
        myList.insert(nodeWithKey: 30, at: 2)
        myList.insert(nodeWithKey: 40, at: 3)
        
        
        myCopy.head = Node(key: 10)
        myCopy.insert(nodeWithKey: 20, at: 1)
        myCopy.insert(nodeWithKey: 30, at: 2)
        myCopy.insert(nodeWithKey: 40, at: 3)
        
    }
    
    
    func testCount() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(myList.count == 4)
        XCTAssert(emptyList.count == 0)
    }
    
    func testAppend() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let appendedList = LinkedList<Int>()
        appendedList.head = Node(key: 10)
        appendedList.insert(nodeWithKey: 20, at: 1)
        appendedList.insert(nodeWithKey: 30, at: 2)
        appendedList.insert(nodeWithKey: 40, at: 3)
        appendedList.insert(nodeWithKey: 50, at: 4)
        
        
        myList.append(element: 50)
        myCopy.append(element: 50)
        
        XCTAssert(myList.benEquals(otherList: appendedList))
        
        
        
    }
    
    func testEquals() {
        XCTAssertTrue(myList.equals(otherList: myCopy))
        XCTAssertFalse(myList.equals(otherList: emptyList))
    }
    
    func testContains() {
        XCTAssertTrue(myList.contains(element: 30))
        XCTAssertTrue(myList.contains(element: 10))
        XCTAssertFalse(myList.contains(element: 5))
        XCTAssertFalse(emptyList.contains(element: 10))
    }
    func testMerge() {
        let listOne = LinkedList<Int>()
        let listTwo = LinkedList<Int>()
        let mergedList = LinkedList<Int>()
        
        listOne.insert(nodeWithKey: 2, at: 0)
        listOne.insert(nodeWithKey: 4, at: 1)
        listOne.insert(nodeWithKey: 5, at: 2)
        listOne.insert(nodeWithKey: 7, at: 3)
        
        listTwo.insert(nodeWithKey: 1, at: 0)
        listTwo.insert(nodeWithKey: 3, at: 1)
        listTwo.insert(nodeWithKey: 6, at: 2)
        listTwo.insert(nodeWithKey: 8, at: 3)
        listTwo.insert(nodeWithKey: 9, at: 4)
        
        mergedList.insert(nodeWithKey: 1, at: 0)
        mergedList.insert(nodeWithKey: 2, at: 1)
        mergedList.insert(nodeWithKey: 3, at: 2)
        mergedList.insert(nodeWithKey: 4, at: 3)
        mergedList.insert(nodeWithKey: 5, at: 4)
        mergedList.insert(nodeWithKey: 6, at: 5)
        mergedList.insert(nodeWithKey: 7, at: 6)
        mergedList.insert(nodeWithKey: 8, at: 7)
        mergedList.insert(nodeWithKey: 9, at: 8)
        
        XCTAssertTrue(LinkedList<Int>.mergeSortedLists(listOne: listOne, listTwo: listTwo).benEquals(otherList: mergedList))
        XCTAssertTrue(LinkedList<Int>.mergeSortedLists(listOne: listOne, listTwo: listTwo) == mergedList)
    }
    
    func testRemoveDupes() {
        let dupeList = LinkedList<Int>()
        dupeList.insert(nodeWithKey: 5, at: 0)
        dupeList.insert(nodeWithKey: 5, at: 1)
        dupeList.insert(nodeWithKey: 5, at: 2)
        dupeList.insert(nodeWithKey: 6, at: 3)
        dupeList.insert(nodeWithKey: 6, at: 4)
        dupeList.insert(nodeWithKey: 7, at: 5)
        
        let noDupeList = LinkedList<Int>()
        noDupeList.insert(nodeWithKey: 5, at: 0)
        noDupeList.insert(nodeWithKey: 6, at: 1)
        noDupeList.insert(nodeWithKey: 7, at: 2)
        
        dupeList.removeDuplicatesFromSortedList()
        
        XCTAssertTrue(dupeList.benEquals(otherList: noDupeList))
        XCTAssertTrue(dupeList == noDupeList)
        
    }
    
    func testToArr() {
        let myList = LinkedList<Int>()
        myList.head = Node(key: 10)
        myList.insert(nodeWithKey: 20, at: 1)
        myList.insert(nodeWithKey: 30, at: 2)
        myList.insert(nodeWithKey: 40, at: 3)
        myList.insert(nodeWithKey: 50, at: 4)
        XCTAssertTrue(myList.toArr() == [10,20,30,40,50])
        XCTAssertTrue(emptyList.toArr() == Array<Int>())
    }
    
    func testReversed() {
        let myList = LinkedList<Int>()
        myList.head = Node(key: 10)
        myList.insert(nodeWithKey: 20, at: 1)
        myList.insert(nodeWithKey: 30, at: 2)
        myList.insert(nodeWithKey: 40, at: 3)
        myList.insert(nodeWithKey: 50, at: 4)
        
        let backwardsList = LinkedList<Int>()
        backwardsList.head = Node(key: 50)
        backwardsList.insert(nodeWithKey: 40, at: 1)
        backwardsList.insert(nodeWithKey: 30, at: 2)
        backwardsList.insert(nodeWithKey: 20, at: 3)
        backwardsList.insert(nodeWithKey: 10, at: 4)
        
        
        XCTAssertTrue(myList.reversed().benEquals(otherList: backwardsList))
        
    }
    
    func testRemoveAll() {
        let myList = LinkedList<Int>()
        myList.head = Node(key: 10)
        myList.insert(nodeWithKey: 20, at: 1)
        myList.insert(nodeWithKey: 30, at: 2)
        myList.insert(nodeWithKey: 40, at: 3)
        myList.insert(nodeWithKey: 50, at: 4)
        
        myList.removeAll()
        
        XCTAssertTrue(myList == emptyList)
        XCTAssertTrue(myList.benEquals(otherList: emptyList))
    }
    
    func testGetNode() {
        let myList = LinkedList<Int>()
        myList.head = Node(key: 10)
        let targetNode = Node(key: 20)
        myList.head?.next = targetNode
        myList.insert(nodeWithKey: 30, at: 2)
        myList.insert(nodeWithKey: 40, at: 3)
        
        let userNode: Node<Int> = myList.getNode(at: 1)!
        XCTAssertTrue(userNode === targetNode)
        let nilNode: Node<Int>? = emptyList.getNode(at: 1)
        XCTAssertNil(nilNode)
    }
    
}


//SPOILERS
extension LinkedList {
    var benCount: Int {
        var count = 0
        var currentNode = head
        while currentNode != nil {
            count += 1
            currentNode = currentNode?.next
        }
        return count
    }
    
    func insert(nodeWithKey k: T, at index: Int) {
        guard index != 0 else {
            let newHead = Node(key: k)
            newHead.next = head?.next
            self.head = newHead
            return
        }
        var currentIndex = 0
        var currentNode = head
        while currentNode != nil {
            if currentIndex == index - 1 {
                let nodeToInsert = Node(key: k)
                let nodeToInsertsNextNode = currentNode?.next
                currentNode?.next = nodeToInsert
                nodeToInsert.next = nodeToInsertsNextNode
            }
            currentIndex += 1
            currentNode = currentNode?.next
        }
        let newNode = Node(key: k)
        currentNode?.next = newNode
    }
    func benEquals(otherList: LinkedList ) -> Bool {
        guard self.benCount == otherList.benCount else {
            return false
        }
        var selfCurrentNode: Node? = self.head
        var otherCurrentNode: Node? = otherList.head
        while selfCurrentNode != nil {
            if selfCurrentNode?.key != otherCurrentNode?.key {
                return false
            } else {
                selfCurrentNode = selfCurrentNode?.next
                otherCurrentNode = otherCurrentNode?.next
            }
        }
        return true
    }
}

extension LinkedList: Equatable {
    public static func ==(lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        guard lhs.benCount == rhs.benCount else { return false }
        
        var currentNodeLeft = lhs.head
        var currentNodeRight = rhs.head
        while currentNodeLeft != nil {
            guard currentNodeLeft?.key == currentNodeRight?.key else { return false }
            currentNodeLeft = currentNodeLeft?.next
            currentNodeRight = currentNodeRight?.next
        }
        
        return true
    }
}
