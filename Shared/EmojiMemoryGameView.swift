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
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
            }
        })

        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct CardView: View {
    var card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
        
        ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(4)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0 ))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                }
        .cardify(isFaceUp: card.isFaceUp)

        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.height, size.width) / (DrawingConstants.fontSize / DrawingConstants.scalingFactor)
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.height, size.width) * DrawingConstants.scalingFactor)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 25.0
        static let scalingFactor: CGFloat = 0.75
        static let lineWidth: CGFloat = 3.0
        static let fontSize: CGFloat = 32
    }
    
}


 


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
