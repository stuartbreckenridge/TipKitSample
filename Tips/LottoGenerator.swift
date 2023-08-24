//
//  LottoGenerator.swift
//  Tips
//
//  Created by Stuart Breckenridge on 26/07/2023.
//

import Foundation
import GameplayKit


/// The `LottoGenerator` has one function, `new()`, which returns an ordered array of random numbers betwwen 1 and 59.
public struct LottoGenerator {
    
    /// Generate a random array of numbers, in the range of 1 - 59.
    /// - Returns: Array of unique `Int`s, ordered ascending.
    static func new() -> [Int] {
        var set = Set<Int>()
        while set.count < 6 { set.insert(GKRandomDistribution(lowestValue: 1, highestValue: 59).nextInt())  }
        return Array(set).sorted()
    }
    
}
