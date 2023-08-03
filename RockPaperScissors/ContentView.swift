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
    //    @State private var condition = "win"
    //    @State private var shouldWin = false
    @State private var userScore = 0
    @State private var appScore = 0
    @State private var round = 1
    @State private var gameOver = false
    let items = ["🪨", "📜", "✂️"]
    
    var body: some View {
        VStack {
            Text("YOU: \(userScore)")
            Text("APP: \(appScore)")
            Text("Round: \(round)")
            //            Text("You should \(condition)")
            Spacer()
            HStack {
                Spacer()
                Text(userChoice)
                    .font(.system(size: 100))
                Spacer()
                Text(appChoice)
                    .font(.system(size: 100))
                Spacer()
            }
            Spacer()
            HStack {
                ForEach(0..<3){ number in
                    Spacer()
                    Button(items[number]) {
                        userChoice = items[number]
                        appChoice = items[Int.random(in: 0..<3)]
                        checkResult()
                        round += 1
                        if round == 11 {
                            gameOver = true
                        }
                    }
                    .font(.system(size: 50))
                    .buttonStyle(.bordered)
                    Spacer()
                }
            }
            .padding(.bottom)
        }
        .padding()
        .alert("Game Over!", isPresented: $gameOver) {
            Button("New Game") {
               resetScore()
            }
        }
    }
    
    func resetScore() {
        userScore = 0
        appScore = 0
        round = 1
        gameOver = false
    }
    
    func checkResult() {
        if userChoice == items[0] && appChoice == items[1] {
            appScore += 1
        } else if userChoice == items[0] && appChoice == items[2] {
            userScore += 1
        } else if userChoice == items[1] && appChoice == items[2] {
            appScore += 1
        } else if userChoice == items[1] && appChoice == items[0] {
            userScore += 1
        } else if userChoice == items[2] && appChoice == items[0] {
            appScore += 1
        } else if userChoice == items[2] && appChoice == items[1] {
            userScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
