//
//  Memorize_GameApp.swift
//  Shared
//
//  Created by Yash Poojary on 16/08/21.
//

import SwiftUI

@main
struct Memorize_GameApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
