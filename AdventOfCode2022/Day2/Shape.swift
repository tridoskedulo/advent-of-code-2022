//
//  Shape.swift
//  AdventOfCode2022
//
//  Created by Tri Do on 02/12/2022.
//

import Foundation

// Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock
// If both players choose the same shape, the round instead ends in a draw.
enum Shape: Int, CustomStringConvertible {

    case A, X // Rocks
    case B, Y // Papers
    case C, Z // Scissors
    var value: Int {
        switch self {
        case .A, .X:
            return 1
        case .B, .Y:
            return 2
        case .C, .Z:
            return 3
        }
    }
    
    var description: String {
        switch self {
        case .A:
            return "A"
        case .X:
            return "X"
        case .B:
            return "B"
        case .Y:
            return "Y"
        case .C:
            return "C"
        case .Z:
            return "Z"
        }
    }
    
    static func initialize(stringValue: String)-> Shape? {
        switch stringValue {
        case Shape.A.description:
            return .A
        case Shape.B.description:
            return .B
        case Shape.C.description:
            return .C
        case Shape.X.description:
            return .X
        case Shape.Y.description:
            return .Y
        case Shape.Z.description:
            return .Z
        default:
            return nil
        }
    }
}
