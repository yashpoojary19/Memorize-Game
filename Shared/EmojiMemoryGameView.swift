//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Yash Poojary on 16/08/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
@ObservedObject var game: EmojiMemoryGame

    var body: some View {
        ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(game.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct CardView: View {
    var card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if card.isFaceUp {
            shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                Text(card.content).font(font(in: geometry.size))
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstants.scalingFactor)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 25.0
        static let scalingFactor: CGFloat = 0.8
        static let lineWidth: CGFloat = 3.0
    }
    
}


 


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
