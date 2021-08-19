//
//  EmojiMemoryGame.swift
//  Memorize Game
//
//  Created by Yash Poojary on 16/08/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚛", "🚙", "🚖", "🏎","🛺", "✈️", "🛳"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 7)
            { pairIndex in emojis[pairIndex]}
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
        
    }

    func choose (_ card: MemoryGame<String>.Card) {
            model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}




