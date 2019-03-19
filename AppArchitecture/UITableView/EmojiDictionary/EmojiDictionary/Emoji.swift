//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Néstor Iván on 3/18/19.
//  Copyright © 2019 Néstor Iván. All rights reserved.
//

import Foundation
import UIKit

class Emoji: CustomStringConvertible{
    var symbol: String
    var name: String
    var emojiDescription: String
    var usage: String
    
    init(symbol: String, name: String, emojiDescription: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.emojiDescription = emojiDescription
        self.usage = usage
    }
    var description: String {
        return "Emoji(symbol: \(symbol), name: \(name), description: \(emojiDescription), usage: \(usage))"
    }
}
