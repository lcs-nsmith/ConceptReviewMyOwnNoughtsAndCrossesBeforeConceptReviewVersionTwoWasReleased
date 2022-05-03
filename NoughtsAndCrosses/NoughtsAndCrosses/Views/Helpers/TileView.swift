//
//  TileView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import SwiftUI

struct TileView: View {
    
    // MARK: Stored properties
    
    // Receives the connection to a source of truth
    // in the calling view.
    // When state changes here, it's new value is
    // sent there to be saved.
    @Binding var state: String
    
    // Which player tapped this tile?
    let player: String
    
    // Connect to property on calling view.
    // Allows turn to be advanced.
    @Binding var turn: Int
    
    // MARK: Computed property
    var body: some View {
        Text(state)
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .border(Color.black, width: 3)
        // Ensure the "hit box" is the entire view
        // (Normally transparent parts of view cannot be tapped)
            .contentShape(Rectangle())
        // Taps on view uses the tile
            .onTapGesture {
                if state == "" {
                    // Make this tile show the symbol for the current player
                    state = player
                    
                    // Advance to next turn
                    turn += 1
                }
                
            }
    }
    
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(state: .constant(empty),
                 player: nought,
                 turn: .constant(1))
        TileView(state: .constant(nought),
                 player: nought,
                 turn: .constant(1))
        TileView(state: .constant(cross),
                 player: nought,
                 turn: .constant(1))
    }
}
