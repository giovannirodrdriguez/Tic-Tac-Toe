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
    @State private var gameOver = false
    @State private var winMessage = ""
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
        }
        .padding()
        .preferredColorScheme(.dark)
        .alert(isPresented: $gameOver) {
            Alert(title: Text(winMessage))
        }
        .onChange(of: moves) {
            checkForWinner()
        }
    }
    private func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2)
        checkLine(a: 3, b: 4, c: 5)
        checkLine(a: 6, b: 7, c: 8)
        checkLine(a: 0, b: 3, c: 6)
        checkLine(a: 1, b: 4, c: 7)
        checkLine(a: 2, b: 5, c: 8)
        checkLine(a: 0, b: 4, c: 8)
        checkLine(a: 2, b: 4, c: 6)
    }
    private func checkLine(a: Int, b: Int, c: Int) {
        if moves[0] != "" && moves[0] == moves[1] && moves[1] == moves[2] {
            winMessage = "\(moves[0]) is the winner!"
            gameOver = true
        }
    }
}
    #Preview {
        ContentView()
        
    }
