//
//  DiskManager.swift
//  EmojiDictionary_CustomCell
//
//  Created by Néstor I. Martínez Ostoa  on 3/20/19.
//  Copyright © 2019 Néstor Iván. All rights reserved.
//

import Foundation

struct DiskManager {
    
    private let directory = FileManager.default.urls(for: .documentationDirectory, in: .userDomainMask).first!
    
    func saveToFile(emojis: [Emoji]) {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let urlToSaveData = directory.appendingPathComponent("emojis").appendingPathExtension("plist")
        let propertyEncoder = PropertyListEncoder()
        let encodedEmojis = try? propertyEncoder.encode(emojis)
        try? encodedEmojis?.write(to: urlToSaveData, options: .noFileProtection)
    }
    
    func loadFromFile() -> [Emoji] {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let urlToSaveData = directory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
        let propertyDecoder = PropertyListDecoder()
        if let retrievedEmojis = try? Data(contentsOf: urlToSaveData), let decodedEmojis = try? propertyDecoder.decode([Emoji].self, from: retrievedEmojis) {
            return decodedEmojis
        }else {
            return [Emoji]()
        }
    }
    
    func loadSampleEmojis() -> [Emoji] {
        let emojis : [Emoji] = [Emoji(symbol: "🎾", name: "Tennis Ball", symbolDescription: "Ball representing tennis", usage: "Sports"),
                                Emoji(symbol: "🏈", name: "FootBall", symbolDescription: "Ball representing football", usage: "Sports"),
                                Emoji(symbol: "⚽️", name: "Soccer", symbolDescription: "Ball representing soccer", usage: "Sports")]
        return emojis
    }
}
