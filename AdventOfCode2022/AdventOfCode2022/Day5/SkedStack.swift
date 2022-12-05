//
//  SkedStack.swift
//  AdventOfCode2022
//
//  Created by Tri Do on 05/12/2022.
//

import Foundation

class SkedStack<T>: CustomStringConvertible {

    init?(_ values: T...) {
        items.removeAll()
        values.forEach {
            push($0)
        }
    }
    
    // array of items
    private var items: [T] = []
    
    // to print the formatted description
    var description: String {
        return items.map({ "\($0)" }).joined(separator: ", ")
    }
    
    var total: Int {
        get {
            return items.count
        }
    }
    
    func push(_ item: T) {
        self.items.insert(item, at: 0)
    }
    
    func pushItems(_ item: [T]) {
        self.items.insert(contentsOf: item, at: 0)
    }
    
    func clear() {
        self.items.removeAll()
    }
    
    @discardableResult
    func pop() -> T? {
        if items.isEmpty { return nil }
        return self.items.removeFirst()
    }
    
    func peek() -> T? {
        return self.items.first
    }
    
    @discardableResult
    func popItems(numOfItems: Int = 0) -> [T]? {
        let popedItems = Array(self.items.prefix(numOfItems))
        self.items.removeFirst(numOfItems)
        return popedItems
    }
}
