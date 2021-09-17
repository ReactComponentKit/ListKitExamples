//
//  EmojiHelper.swift
//  ListKitExamples
//
//  Created by burt on 2021/09/17.
//

import Foundation

/// @see { https://stackoverflow.com/questions/34712453/how-to-generate-a-random-number-in-a-range-10-20-using-swift }
extension CountableRange where Bound == Int {
    var random: Int {
        return lowerBound + numericCast(arc4random_uniform(numericCast(count)))
    }
    
    func random(_ n: Int) -> [Int] {
        return (0..<n).map { _ in random }
    }
}

extension CountableClosedRange where Bound == Int {
    var random: Int {
        return lowerBound + numericCast(arc4random_uniform(numericCast(count)))
    }
    
    func random(_ n: Int) -> [Int] {
        return (0..<n).map { _ in random }
    }
}

class EmojiHelper {
    private static let emojiRange = (0x1F600...0x1F64F)
    private var emojis: [String]
    static let shared = EmojiHelper()
    
    init() {
        emojis = Self.emojiRange.compactMap { UnicodeScalar($0) }.map(String.init)
    }
    
    func emoji() -> String? {
        guard emojis.count > 0 else { return nil }
        let index = (0..<emojis.count).random
        return emojis.remove(at: index)
    }
    
    func append(emoji: String) {
        if !emojis.contains(emoji) {
            emojis.append(emoji)
        }
    }
}

extension Array {
    mutating func shuffle() {
        for _ in 0..<count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
