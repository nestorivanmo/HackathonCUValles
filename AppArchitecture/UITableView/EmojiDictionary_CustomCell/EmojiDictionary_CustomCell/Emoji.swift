//
//  Emoji.swift
//  EmojiDictionary_CustomCell
//
//  Created by Néstor Iván on 3/19/19.
//  Copyright © 2019 Néstor Iván. All rights reserved.
//

import Foundation
import UIKit

class Emoji: CustomStringConvertible, Codable {
    
    var symbol: String
    var name: String
    var symbolDescription: String
    var usage: String
    
    init(symbol: String, name: String, symbolDescription: String, usage: String ) {
        self.symbol = symbol
        self.name = name
        self.symbolDescription = symbolDescription
        self.usage = usage
    }
    
    var description: String {
        return """
        Emoji:
        \n\t symbol: \(symbol)
        \n\t name: \(name)
        \n\t symbolDescription: \(symbolDescription)
        \n\t usage: \(usage)
        """
    }
    
}
