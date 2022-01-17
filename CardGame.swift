/**
 *  Author: Meer Abdullah
 *  Since: May 30, 2021
 *  Version: 1.0
 *  Synopsis: Card Game vs CPU: based on RNG.
 *  ContentView.swift
 *  CardGame
 */
import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack{
            Spacer()
            Image("background").ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                // Displays the Player and CPU's card (initially).
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                / /Creating an action for the button - occurrs everytime it's clicked.
                Button(action: {
                    //Generate a random number from 2-14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    //Update the cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    //Update the score
                    if playerRand > cpuRand {
                        playerScore += 1
                    }else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    // Giving the button an image
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                // Placing text horizontally
                HStack{
                    Spacer()
                    // Places Player Info vertically
                    VStack{
                        Text("Player").font(.headline).foregroundColor(Color.black).padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.black)
                    }
                    // Evenly/Neatly space out player vs CPU info (works on all iPhone generations)
                    Spacer()
                    // Places CPU info vertically
                    VStack{
                        Text("CPU").font(.headline).foregroundColor(Color.black).padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle).foregroundColor(Color.black)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
