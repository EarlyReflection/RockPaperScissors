//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Vladimir Dvornikov on 03/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var appChoice = ""
    @State private var userChoice = ""

    @State private var userScore = 0
    @State private var appScore = 0
    @State private var round = 1
    @State private var gameOver = false
    let items = ["🪨", "📜", "✂️"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .green], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                Text("YOU: \(userScore)")
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                    Spacer()
                Text("APP: \(appScore)")
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                    Spacer()
            }
                .foregroundColor(.black)
                .padding(.top, 10)
                
            Spacer()
            HStack {
                Spacer()
                Text(userChoice)
                    .font(.system(size: 150))
                Spacer()
                Text(appChoice)
                    .font(.system(size: 150))
                Spacer()
            }
                
            Spacer()
            HStack {
                ForEach(0..<3){ number in
                    Button(items[number]) {
                        userChoice = items[number]
                        let randNumber = Int.random(in: 0..<3)
                        appChoice = items[randNumber]
                        
                        if userChoice != appChoice {
                            check(number, randNumber)
                        }
                        round += 1
                        if round == 11 {
                            gameOver = true
                        }
                    }
                    .font(.system(size: 50))
                    .buttonStyle(.bordered)
                    .padding(5)
                }
            }
            .padding(7)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        .padding()
        .alert("Game Over!", isPresented: $gameOver) {
            Button("New Game") {
                resetScore()
            }
            }
        }
    }
    
    func resetScore() {
        userScore = 0
        appScore = 0
        round = 1
        gameOver = false
    }
    
    func check(_ number: Int, _ randNumber: Int) {
        let win = [1, 2, 0]
        if number == win[randNumber] {
            userScore += 1
        } else {
            appScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
