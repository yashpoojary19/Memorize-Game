//
//  ContentView.swift
//  Shared
//
//  Created by Yash Poojary on 16/08/21.
//

import SwiftUI

struct ContentView: View {
        var emojis = ["🚛", "🚙", "🛵", "🚖"]
@State    var emojiCount = 4
    var body: some View {
        ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct CardView: View {
@State   var isFaceUp: Bool = false
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
            shape.fill().foregroundColor(.white)
            shape.stroke(lineWidth: 3)
            Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
