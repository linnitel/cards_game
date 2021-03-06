//
//  EmojiGenerator.swift
//  memmory_cards_game
//
//  Created by Yuliya Martsenko on 24.07.2021.
//

import Foundation

class EmojiGenerator {
    var emoji = [["ðĶ", "ðą", "ð", "ð", "ð", "ðŧ", "ð­", "ðŽ", "ð"], ["ðŊ", "ðĶ", "ðĻ", "ðļ", "ð", "ð", "ðž", "ðĶ", "ð"], ["ðđ", "ðĪžââïļ", "ð", "ðââïļ", "ðĨ", "ðĢââïļ", "ðĪ―", "âđïļââïļ", "ðĪš"], ["ð", "ðŪ", "ðą", "ðĨĻ", "ðĨŦ", "ð", "ð", "ð§", "ðģ", "ðĨĶ", "ð"]]
    lazy var emojiOptions = emoji[Int(arc4random_uniform(UInt32(emoji.count)))]
    var emojiSet = Dictionary<Int, String>()
    
    func emojiPicker(for card: Card) -> String {
        if emojiSet[card.identifier] == nil, emojiOptions.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiOptions.count)))
            emojiSet[card.identifier] = emojiOptions.remove(at: randomIndex)
        }
        return emojiSet[card.identifier] ?? "?"
    }
    
//    func renewSet() {
//        emojiOptions = emoji[Int(arc4random_uniform(UInt32(emoji.count)))]
//        if !emojiSet.isEmpty {
//            emojiSet.removeAll()
//        }
//    }
}
