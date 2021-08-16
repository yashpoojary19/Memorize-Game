//
//  MemoryGame.swift
//  Memorize Game
//
//  Created by Yash Poojary on 16/08/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly}
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)}}}
    
    mutating func choose ( _ card: Card) where CardContent: Equatable {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        
        cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
        
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
    }
    
   
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
    
}


extension Array {
    var oneAndOnly: Element? {
    if self.count == 1 {
        return self.first
    } else {
        return nil
        }
    }
    
}
