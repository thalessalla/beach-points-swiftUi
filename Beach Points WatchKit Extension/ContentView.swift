//
//  ContentView.swift
//  Beach Points WatchKit Extension
//
//  Created by Thales on 27/03/23.
//

import SwiftUI
import WatchKit


struct ContentView: View {
    @State var playerScore = 0
    @State var opponentScore = 0
    @State var meuSet = 0
    @State var opponentSet = 0
    
    @State var contadorP1 = 0
    @State var contadorP2 = 0
    @State var player1Score = 0
    @State var player2Score = 0
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    let cinza2 = Color(red: 99, green: 96, blue: 95)
    let vermelho = Color(red: 132, green: 30, blue: 30)
    
    
    var body: some View {
        
    
        
        VStack {
            
          
            Button(action: {
                zerar()})
            {
                Text("Zerar jogo")
             }
            .foregroundColor(.red)
            .padding(.top, 25)
            
            
                        
            HStack {
                Text(" \(contadorP1)")
                Text("x")
                    .foregroundColor(cinza2)
                    .padding(.horizontal, 5)
                Text(" \(contadorP2)")
                
            }
                        
            HStack {
                
                VStack {
                    Text(" \(playerScore)")
                        .font(.title)
                    Text("Meu time")
                        
                }
               
                
                Text("x")
                    .foregroundColor(cinza2)
                    .padding(.horizontal, 0)
                    
                
                VStack {
                    Text(" \(opponentScore)")
                        .font(.title)
                    Text("Oponente")                }
                
                
                
            }
            
           
            
            
            
            HStack {
              
                Button(action: {
                    incrementPlayerScore()
                }) {
                    Text("+")
                        .font(.title2)
                    .foregroundColor(.blue)                }
                
                Button(action: {
                    incrementOpponentScore()
                }) {
                    Text("+")
                        .font(.title2)
                        
                }.foregroundColor(.blue)            }
            
           
            
            
            .alert(isPresented: $showAlert) {
                        Alert(title: Text("Fim de jogo!"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
            
        }
    }
    
    
    
   
    
    
    func incrementPlayerScore() {
        if playerScore == 0 {
            playerScore = 15
        } else if playerScore == 15 {
            playerScore = 30
        } else if playerScore == 30 {
            playerScore = 40
        } else if playerScore == 40 {
           playerScore = 50
            setsPlayer1()
            WKInterfaceDevice.current().play(.notification);            playerScore = 0
            opponentScore = 0
            
        }
    }
    
    func incrementOpponentScore() {
        if opponentScore == 0 {
            opponentScore = 15
        } else if opponentScore == 15 {
            opponentScore = 30
        } else if opponentScore == 30 {
            opponentScore = 40
        } else if opponentScore == 40 {
            opponentScore = 50
            WKInterfaceDevice.current().play(.notification);
            opponentScore = 0
            setsPlayer2()
            playerScore = 0
        }
        }


    func setsPlayer1() {
            contadorP1 += 1
            if contadorP1 == 6 && contadorP2 <= 4 {
                self.alertMessage = "Parabéns, você ganhou.";
                self.showAlert = true
                zerar()
                } else if contadorP1 == 7 && contadorP2 <= 5 {
                    self.alertMessage = "Parabéns, você ganhou.";
                    self.showAlert = true
                    zerar()
                } else if contadorP1 == 8 && contadorP2 <= 6 {
                    self.alertMessage = "Parabéns, você ganhou.";
                    self.showAlert = true
                    zerar()
                } else if contadorP1 == 9 && contadorP2 <= 7 {
                        self.alertMessage = "Parabéns, você ganhou.";
                        self.showAlert = true
                        zerar()            }
        }
        
        func setsPlayer2() {
            contadorP2 += 1
            if contadorP2 == 6 && contadorP1 <= 4 {
                self.alertMessage = "Não foi dessa vez :(";
                self.showAlert = true
                zerar()
            } else if contadorP2 == 7 && contadorP1 <= 5 {
                self.alertMessage = "Não foi dessa vez :(";
                self.showAlert = true
                zerar()
            } else if contadorP2 == 8 && contadorP1 <= 6 {
                self.alertMessage = "Não foi dessa vez :(";
                self.showAlert = true
                zerar()
            } else if contadorP2 == 9 && contadorP1 <= 7 {
                self.alertMessage = "Não foi dessa vez :(";
                self.showAlert = true
                zerar()
            }
        }
        
        func zerar() {
            contadorP1 = 0
            contadorP2 = 0
            playerScore = 0
            opponentScore = 0
        }
        


    
       

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
