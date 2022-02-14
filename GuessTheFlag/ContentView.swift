//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Debashish Mondal on 1/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var playerScore = 0
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .indigo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 40){
                VStack{
                    Text("Tap the flag off")
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                        .foregroundStyle(.secondary)
                        
                }
                ForEach(0..<3) {number in
                    Button{
                        ansTapped(number)
                    }label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .cornerRadius(4)
                            .shadow(radius: 5)
                    }
                }

            }

        }
        
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Next Quiz", action: refresh)
        }message: {
            Text("Your Score is \(playerScore)")
        }
    }
    
    

    
    func ansTapped(_ number : Int){
        if correctAnswer == number{
            showingScore = true
            scoreTitle = "Correct Answer!"
            playerScore += 1
        }else{
            scoreTitle = "Wrong Answer"
            playerScore -= 1
            showingScore = true

        }
    }
    func refresh(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}

