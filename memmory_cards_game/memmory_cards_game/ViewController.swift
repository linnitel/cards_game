//
//  ViewController.swift
//  memmory_cards_game
//
//  Created by Yuliya Martsenko on 23.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = CardsGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    lazy var emojiGenerator = EmojiGenerator()
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLable: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    @IBAction func NewGameButton(_ sender: Any) {
        emojiGenerator = EmojiGenerator()
        game = CardsGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
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
                button.setTitle(emojiGenerator.emojiPicker(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
        flipCountLable.text = "Flips: \(game.flip)"
        scoreCountLabel.text = "Score: \(game.score)"
    }
}


