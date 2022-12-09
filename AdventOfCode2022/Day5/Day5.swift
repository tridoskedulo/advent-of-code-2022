//
//  Day5.swift
//  AdventOfCode2022
//
//  Created by Tri Do on 05/12/2022.
//

import Foundation

class Day5 {
    
    static let stacks = [
        SkedStack("J", "H", "P", "M", "S", "F", "N", "V"),
        SkedStack("S", "R", "L", "M", "J", "D", "Q"),
        SkedStack("N", "Q", "D", "H", "C", "S", "W", "B"),
        SkedStack("R", "S", "C", "L"),
        SkedStack("M", "V", "T", "P", "F", "B"),
        SkedStack("T", "R", "Q", "N", "C"),
        SkedStack("G", "V", "R"),
        SkedStack("C", "Z", "S", "P", "D", "L", "R"),
        SkedStack("D", "S", "J", "V", "G", "P", "B", "F")
    ]
    
    class func findTopCrates(isMultiplePop: Bool = false) {

        let actions = input.components(separatedBy: CharacterSet.newlines)
        for action in actions {
            let matches = action.match("move ([0-9]+) from ([0-9]+) to ([0-9]+)")
            guard matches.count > 0, matches[0].count == 4 else { // make sure pattern correctly
                continue
            }

            let move = Int(matches[0][1]) ?? -1
            let from = Int(matches[0][2]) ?? -1
            let to = Int(matches[0][3]) ?? -1
            if move <= 0 || from <= 0 || to <= 0 {
                continue
            }
            print("\(move) - \(from) - \(to)")
            let stackFrom = stacks[from - 1]
            let stackTo = stacks[to - 1]
            
            if isMultiplePop {
                if let value = stackFrom?.popItems(numOfItems: move) {
                    stackTo?.pushItems(value)
                }
            } else {
                for _ in 0..<move {
                    if let value = stackFrom?.pop() {
                        stackTo?.push(value)
                    }
                }
            }
        }
        // find peek of stack
        var peekStrings = ""
        for stack in stacks {
            peekStrings += stack?.peek() ?? ""
        }
        print(peekStrings)
    }
    
    static let input = """
move 1 from 8 to 4
move 1 from 7 to 8
move 1 from 6 to 3
move 2 from 6 to 5
move 8 from 5 to 1
move 5 from 3 to 8
move 1 from 7 to 8
move 8 from 1 to 2
move 3 from 3 to 9
move 13 from 8 to 7
move 2 from 1 to 2
move 1 from 6 to 2
move 2 from 1 to 7
move 4 from 4 to 2
move 10 from 9 to 4
move 7 from 4 to 1
move 1 from 6 to 7
move 2 from 4 to 5
move 1 from 5 to 2
move 1 from 5 to 8
move 3 from 1 to 5
move 2 from 4 to 6
move 2 from 6 to 4
move 2 from 4 to 5
move 5 from 1 to 5
move 1 from 9 to 5
move 1 from 8 to 5
move 14 from 2 to 6
move 12 from 7 to 4
move 4 from 6 to 7
move 3 from 6 to 4
move 4 from 4 to 9
move 2 from 4 to 6
move 2 from 9 to 3
move 9 from 4 to 3
move 2 from 1 to 6
move 5 from 7 to 3
move 4 from 7 to 8
move 2 from 6 to 7
move 3 from 6 to 7
move 10 from 5 to 8
move 8 from 8 to 9
move 10 from 9 to 7
move 12 from 7 to 5
move 1 from 1 to 5
move 3 from 7 to 2
move 10 from 3 to 7
move 6 from 5 to 7
move 2 from 6 to 1
move 12 from 2 to 7
move 3 from 3 to 1
move 1 from 6 to 5
move 10 from 5 to 7
move 3 from 3 to 4
move 34 from 7 to 1
move 2 from 6 to 9
move 1 from 6 to 3
move 3 from 1 to 3
move 1 from 7 to 3
move 3 from 3 to 6
move 1 from 4 to 3
move 22 from 1 to 6
move 2 from 9 to 7
move 2 from 4 to 9
move 12 from 6 to 8
move 1 from 7 to 6
move 4 from 8 to 2
move 1 from 7 to 1
move 6 from 8 to 9
move 1 from 2 to 5
move 1 from 2 to 7
move 13 from 1 to 2
move 2 from 3 to 1
move 4 from 7 to 5
move 3 from 9 to 4
move 1 from 1 to 8
move 4 from 5 to 2
move 12 from 6 to 2
move 3 from 1 to 3
move 1 from 4 to 1
move 9 from 8 to 5
move 6 from 5 to 7
move 2 from 4 to 5
move 5 from 9 to 6
move 5 from 3 to 7
move 30 from 2 to 6
move 11 from 7 to 9
move 36 from 6 to 3
move 10 from 9 to 3
move 1 from 6 to 5
move 3 from 5 to 2
move 2 from 5 to 2
move 28 from 3 to 4
move 6 from 4 to 1
move 1 from 2 to 3
move 2 from 5 to 2
move 6 from 1 to 7
move 1 from 1 to 6
move 6 from 3 to 5
move 6 from 7 to 2
move 1 from 6 to 4
move 2 from 2 to 6
move 8 from 2 to 1
move 3 from 2 to 4
move 2 from 3 to 4
move 4 from 3 to 4
move 1 from 6 to 1
move 2 from 1 to 8
move 1 from 6 to 4
move 1 from 9 to 3
move 2 from 5 to 4
move 1 from 8 to 7
move 1 from 7 to 9
move 1 from 3 to 5
move 1 from 8 to 6
move 34 from 4 to 9
move 13 from 9 to 8
move 1 from 8 to 2
move 1 from 2 to 1
move 4 from 5 to 1
move 9 from 8 to 7
move 11 from 1 to 3
move 1 from 4 to 2
move 1 from 6 to 7
move 1 from 9 to 4
move 1 from 4 to 1
move 1 from 5 to 3
move 5 from 7 to 8
move 1 from 2 to 5
move 1 from 5 to 1
move 21 from 9 to 5
move 19 from 3 to 4
move 17 from 4 to 6
move 2 from 8 to 4
move 2 from 6 to 8
move 2 from 6 to 9
move 2 from 7 to 6
move 1 from 4 to 9
move 6 from 5 to 6
move 1 from 9 to 8
move 8 from 5 to 7
move 15 from 6 to 2
move 1 from 9 to 7
move 2 from 1 to 6
move 3 from 4 to 7
move 1 from 1 to 6
move 3 from 5 to 4
move 2 from 5 to 6
move 2 from 4 to 1
move 13 from 7 to 8
move 2 from 6 to 4
move 3 from 2 to 4
move 2 from 7 to 6
move 5 from 4 to 6
move 4 from 2 to 6
move 1 from 1 to 9
move 18 from 8 to 3
move 1 from 4 to 5
move 1 from 2 to 7
move 15 from 3 to 1
move 1 from 5 to 1
move 3 from 3 to 4
move 1 from 5 to 4
move 1 from 5 to 6
move 1 from 6 to 8
move 2 from 8 to 2
move 3 from 1 to 8
move 6 from 2 to 8
move 1 from 7 to 6
move 12 from 8 to 5
move 2 from 9 to 6
move 6 from 1 to 5
move 9 from 5 to 3
move 1 from 2 to 8
move 20 from 6 to 9
move 3 from 6 to 7
move 1 from 7 to 1
move 7 from 3 to 4
move 2 from 7 to 2
move 1 from 8 to 7
move 8 from 4 to 1
move 11 from 1 to 7
move 10 from 7 to 6
move 2 from 4 to 9
move 21 from 9 to 3
move 6 from 5 to 9
move 6 from 3 to 2
move 1 from 4 to 5
move 1 from 7 to 9
move 8 from 3 to 2
move 9 from 2 to 1
move 14 from 1 to 6
move 1 from 1 to 7
move 4 from 3 to 8
move 3 from 8 to 7
move 5 from 7 to 4
move 3 from 6 to 9
move 2 from 3 to 7
move 3 from 5 to 6
move 1 from 5 to 6
move 2 from 7 to 9
move 1 from 8 to 3
move 22 from 6 to 5
move 3 from 9 to 4
move 3 from 6 to 1
move 5 from 4 to 6
move 9 from 2 to 8
move 4 from 6 to 1
move 1 from 3 to 2
move 1 from 2 to 3
move 6 from 8 to 1
move 2 from 4 to 3
move 10 from 1 to 7
move 2 from 8 to 7
move 1 from 9 to 6
move 4 from 3 to 5
move 1 from 8 to 3
move 4 from 9 to 8
move 1 from 4 to 3
move 1 from 3 to 8
move 3 from 7 to 6
move 1 from 1 to 5
move 10 from 5 to 9
move 5 from 6 to 4
move 5 from 8 to 5
move 4 from 9 to 8
move 3 from 3 to 9
move 2 from 8 to 6
move 5 from 7 to 5
move 1 from 4 to 1
move 1 from 1 to 2
move 2 from 8 to 6
move 1 from 2 to 1
move 1 from 7 to 2
move 1 from 1 to 5
move 28 from 5 to 9
move 3 from 6 to 1
move 1 from 6 to 9
move 1 from 2 to 9
move 2 from 1 to 2
move 2 from 7 to 5
move 1 from 7 to 5
move 1 from 2 to 5
move 3 from 1 to 9
move 1 from 5 to 8
move 15 from 9 to 2
move 11 from 9 to 4
move 11 from 4 to 7
move 2 from 4 to 1
move 7 from 7 to 8
move 1 from 1 to 4
move 20 from 9 to 1
move 2 from 7 to 8
move 1 from 4 to 6
move 1 from 6 to 2
move 2 from 7 to 5
move 1 from 9 to 6
move 1 from 4 to 9
move 4 from 5 to 2
move 1 from 6 to 8
move 1 from 4 to 9
move 11 from 8 to 3
move 1 from 1 to 9
move 1 from 5 to 9
move 1 from 2 to 6
move 4 from 9 to 8
move 4 from 8 to 7
move 10 from 1 to 6
move 7 from 1 to 5
move 8 from 3 to 4
move 2 from 3 to 5
move 3 from 7 to 4
move 1 from 4 to 5
move 2 from 1 to 6
move 9 from 2 to 6
move 1 from 7 to 9
move 1 from 3 to 2
move 7 from 4 to 3
move 3 from 3 to 7
move 5 from 2 to 3
move 1 from 1 to 9
move 2 from 2 to 7
move 1 from 4 to 6
move 3 from 5 to 6
move 4 from 7 to 6
move 1 from 7 to 4
move 1 from 4 to 7
move 1 from 2 to 8
move 1 from 7 to 1
move 27 from 6 to 2
move 1 from 4 to 1
move 7 from 5 to 7
move 1 from 4 to 1
move 1 from 8 to 3
move 3 from 7 to 3
move 2 from 1 to 6
move 2 from 9 to 1
move 18 from 2 to 1
move 2 from 7 to 5
move 12 from 3 to 4
move 1 from 5 to 6
move 3 from 6 to 1
move 24 from 1 to 8
move 9 from 2 to 4
move 3 from 2 to 1
move 2 from 6 to 3
move 1 from 6 to 9
move 1 from 5 to 6
move 1 from 6 to 2
move 1 from 1 to 7
move 1 from 2 to 1
move 1 from 1 to 2
move 3 from 7 to 2
move 2 from 1 to 4
move 8 from 4 to 5
move 22 from 8 to 1
move 1 from 8 to 1
move 13 from 4 to 1
move 1 from 8 to 5
move 3 from 3 to 1
move 1 from 2 to 7
move 38 from 1 to 6
move 27 from 6 to 1
move 2 from 2 to 9
move 3 from 9 to 8
move 2 from 8 to 6
move 1 from 8 to 3
move 1 from 2 to 1
move 1 from 3 to 6
move 1 from 2 to 3
move 1 from 7 to 6
move 7 from 6 to 3
move 20 from 1 to 4
move 6 from 1 to 6
move 17 from 4 to 7
move 3 from 6 to 5
move 14 from 7 to 9
move 8 from 5 to 7
move 3 from 1 to 6
move 3 from 3 to 1
move 2 from 4 to 1
move 4 from 5 to 1
move 9 from 6 to 2
move 3 from 6 to 4
move 4 from 7 to 8
move 4 from 1 to 6
move 2 from 3 to 1
move 6 from 6 to 7
move 4 from 8 to 7
move 4 from 2 to 1
move 4 from 2 to 3
move 4 from 9 to 5
move 8 from 9 to 5
move 1 from 9 to 5
move 1 from 2 to 1
move 16 from 7 to 2
move 10 from 2 to 9
move 11 from 9 to 8
move 4 from 3 to 5
move 3 from 1 to 4
move 13 from 5 to 7
move 10 from 8 to 5
move 2 from 1 to 5
move 11 from 7 to 4
move 2 from 3 to 6
move 3 from 7 to 6
move 1 from 3 to 2
move 1 from 1 to 8
move 2 from 8 to 4
move 3 from 1 to 2
move 4 from 6 to 1
move 7 from 1 to 9
move 1 from 6 to 7
move 2 from 5 to 8
move 1 from 2 to 9
move 1 from 7 to 8
move 5 from 5 to 8
move 1 from 2 to 3
move 4 from 2 to 5
move 17 from 4 to 1
move 10 from 5 to 9
move 2 from 4 to 2
move 2 from 4 to 1
move 1 from 4 to 9
move 1 from 3 to 7
move 1 from 7 to 8
move 12 from 9 to 2
move 1 from 2 to 4
move 1 from 4 to 1
move 1 from 1 to 9
move 1 from 8 to 1
move 8 from 8 to 3
move 2 from 5 to 1
move 3 from 1 to 9
move 1 from 2 to 6
move 4 from 3 to 7
move 1 from 7 to 6
move 10 from 9 to 2
move 1 from 5 to 9
move 1 from 9 to 3
move 17 from 1 to 6
move 2 from 1 to 2
move 11 from 6 to 7
move 2 from 2 to 9
move 2 from 9 to 5
move 12 from 7 to 9
move 20 from 2 to 7
move 5 from 9 to 5
move 21 from 7 to 1
move 2 from 6 to 4
move 11 from 1 to 4
move 5 from 4 to 6
move 1 from 7 to 8
move 5 from 9 to 3
move 5 from 2 to 8
move 3 from 9 to 3
move 2 from 8 to 7
move 2 from 1 to 7
move 10 from 6 to 3
move 1 from 2 to 6
move 2 from 8 to 5
move 1 from 6 to 5
move 2 from 4 to 9
move 1 from 4 to 5
move 8 from 1 to 6
move 4 from 4 to 8
move 6 from 8 to 4
move 21 from 3 to 9
move 5 from 9 to 2
move 4 from 7 to 9
move 22 from 9 to 3
move 9 from 6 to 4
move 2 from 2 to 6
move 2 from 2 to 1
move 2 from 5 to 7
move 7 from 5 to 4
move 22 from 4 to 2
move 2 from 5 to 4
move 16 from 2 to 5
move 2 from 6 to 2
move 13 from 3 to 4
move 5 from 5 to 7
move 15 from 4 to 7
move 3 from 2 to 3
move 3 from 2 to 5
move 1 from 1 to 2
move 1 from 2 to 4
move 6 from 5 to 9
move 4 from 3 to 6
move 2 from 5 to 9
move 1 from 2 to 7
move 1 from 1 to 9
move 2 from 4 to 5
move 19 from 7 to 8
move 1 from 6 to 5
move 1 from 5 to 1
move 1 from 9 to 4
move 5 from 8 to 1
move 3 from 8 to 1
move 7 from 5 to 6
move 3 from 7 to 1
move 1 from 2 to 5
move 4 from 9 to 8
move 2 from 5 to 6
move 10 from 1 to 4
move 1 from 7 to 2
move 6 from 3 to 4
move 9 from 4 to 3
move 2 from 2 to 8
move 2 from 9 to 5
move 5 from 8 to 3
move 1 from 1 to 5
move 2 from 5 to 6
move 1 from 1 to 7
move 2 from 9 to 7
move 8 from 4 to 7
move 3 from 3 to 9
move 4 from 6 to 3
move 1 from 5 to 3
move 1 from 7 to 2
move 1 from 2 to 1
move 1 from 6 to 5
move 1 from 5 to 2
move 10 from 7 to 4
move 10 from 4 to 1
move 10 from 1 to 8
move 1 from 9 to 6
move 1 from 1 to 4
move 11 from 8 to 1
move 2 from 9 to 5
move 5 from 6 to 3
move 1 from 3 to 8
move 4 from 1 to 3
move 5 from 3 to 8
move 1 from 4 to 7
move 1 from 7 to 2
move 13 from 3 to 5
move 2 from 2 to 1
move 4 from 3 to 1
move 4 from 5 to 6
move 3 from 6 to 2
move 4 from 5 to 4
move 8 from 8 to 7
move 1 from 3 to 9
"""
}
