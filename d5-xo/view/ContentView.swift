//
//  ContentView.swift
//  d5-xo
//
//  Created by Shaimaa on 5/10/20.
//  Copyright © 2020 Shaimaa. All rights reserved.
//

import SwiftUI

import AVKit
import AVFoundation

struct ContentView: View {
    @EnvironmentObject var env : Envr
        var body: some View {
            ZStack{
                Group{
                    env.changingColor.opacity(0.5)
                    .background(
                    Image("spaace")
                        .resizable()
                        .scaledToFill()
                    )
                }.edgesIgnoringSafeArea(.all)
                Button(action: {
                    let url = Bundle.main.path(forResource: "rain-03", ofType: "mp3")
                    self.env.soundP = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
                    self.env.soundP.play()
                }) {
                   // Image(systemName: "play.rectangle")
                    Image(systemName: "play.circle")
                        .font(.system(size: 40.0, weight: .regular))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                }.offset(x: -150, y: -270)
                Button(action: {
                    self.env.soundP.stop()
                }) {
                    Image(systemName: "stop.circle")
                        .font(.system(size: 40.0, weight: .regular))
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                }.offset(x: -100, y: -270)
                VStack{
                    Text(env.winner)
                        .font(.system(size: 70))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .offset(y: -20)
                    if env.winStatus == false {
                        Text("\(env.playerTurn.textName()) Turn")
                        .font(.system(size: 40))
                            .foregroundColor(env.colorPlayerTurnOff)
                        .offset(y: -40)
                    }
                    VStack(spacing: 10){
                        ForEach(0 ..< 3) { r in
                            HStack(spacing: 10){
                                ForEach(0 ..< 3) { c in
                                    Button(action: {
                                        if self.env.fieldsEasyWay[r][c].enabled{
                                            self.env.fieldsEasyWay[r][c].player = self.env.playerTurn
                                            self.env.changingColor = self.env.changingColorArray[self.env.colorCounter]
                                            self.env.drawCounter += 1
                                            self.env.checkWinner()
                                            if self.env.winStatus == false {
                                                self.env.playerTurn.toggle()
                                                self.env.changingColor = self.env.playerTurn.textName() == "X" ? self.env.changingColorArray[0] : self.env.changingColorArray[1]
                                                self.env.changingColorBorder = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                                                self.env.fieldsEasyWay[r][c].enabled = false
                                            }
                                            else {
                                                self.env.colorPlayerTurnOff = self.env.changingColorArray[2]
                                                self.env.changingColor = self.env.changingColorArray[2]
                                                self.env.fieldsEasyWay[0][0].enabled = false
                                                self.env.fieldsEasyWay[0][1].enabled = false
                                                self.env.fieldsEasyWay[0][2].enabled = false
                                                self.env.fieldsEasyWay[1][0].enabled = false
                                                self.env.fieldsEasyWay[1][1].enabled = false
                                                self.env.fieldsEasyWay[1][2].enabled = false
                                                self.env.fieldsEasyWay[2][0].enabled = false
                                                self.env.fieldsEasyWay[2][1].enabled = false
                                                self.env.fieldsEasyWay[2][2].enabled = false
                                            }
                                        }
                                    }) {
                                        Text("\(self.env.fieldsEasyWay[r][c].player.textName())")
                                            .font(.system(size: 60))
                                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                            .frame(width: 90, height: 90, alignment: .center)
                                            .border(self.env.changingColorBorder, width: 5)
                                            .background(Color.white)
                                    }
                                }
                            }
                        }
                    }
                    if env.winner != "" {
                        Button(action: {
                            self.env.restartG()
                        }) {
                            Text("Restart")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .frame(width: 180, height: 40, alignment: .center)
                                .background(Color.white)
                        }.offset(y: 40)
                    }
                }
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(Envr())
    }
}
