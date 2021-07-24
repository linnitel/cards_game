//
//  EmojiGenerator.swift
//  memmory_cards_game
//
//  Created by Yuliya Martsenko on 24.07.2021.
//

import Foundation

class EmojiGenerator {
    var emoji = [["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"], ["🐯", "🦁", "🐨", "🐸", "🐛", "🙊", "🐼", "🦄", "🐙"], ["🏹", "🤼‍♀️", "🏇", "🏊‍♀️", "🥇", "🚣‍♀️", "🤽", "⛹️‍♀️", "🤺"], ["🍎", "🌮", "🍱", "🥨", "🥫", "🍒", "🍉", "🧀", "🍳", "🥦", "🍌"]]
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
