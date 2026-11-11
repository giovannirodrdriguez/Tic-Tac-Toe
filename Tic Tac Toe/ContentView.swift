//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by giovanni rodriguez on 11/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["", "", "", "", "", "", "", "", ""]
    @State private var xTurn = true
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title)
                .bold()
            
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                ForEach(0..<9, id: \.self) { index in
                    ZStack {
                        Color.blue
                        Color.white.opacity(moves[index] == "" ? 1 : 0)
                        Text(moves[index])
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 120, height: 120)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation {
                            if moves[index] == "" {
                                moves[index] = xTurn ? "X" : "O"
                                xTurn.toggle()
                            }
                        }
                    }
                    .rotation3DEffect(
                        .degrees(moves[index] == "" ? 180 : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }
                
            }
            
            .padding()
        }
    }
}
    #Preview {
        ContentView()
    }


