//
//  ViewController.swift
//  memmory_cards_game
//
//  Created by Yuliya Martsenko on 23.07.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    lazy var game = CardsGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLable.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLable: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print ("card is not in the array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiPicker(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    var emojiOptions = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    var emoji = Dictionary<Int, String>()
    func emojiPicker(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiOptions.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiOptions.count)))
            emoji[card.identifier] = emojiOptions.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}


