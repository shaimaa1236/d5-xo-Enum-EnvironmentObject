//
//  soundFile.swift
//  d5-xo
//
//  Created by Shaimaa on 5/10/20.
//  Copyright © 2020 Shaimaa. All rights reserved.
//

import Foundation
import SwiftUI

import AVKit
import AVFoundation

class Envr : ObservableObject {
    @Published var fieldsEasyWay: [[field]] = [[field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)],
    [field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)],
    [field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)]]
    @Published  var playerTurn : PlayerN = .X
    @Published var changingColorArray = [Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.6641962757)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))] // for palayer:x&y&winner
    @Published var changingColor = Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) // in the beginning, then will be template
    @Published var changingColorBorder = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    @Published var colorCounter = 0
    @Published var winner : String = ""
    @Published var winStatus = false
    @Published var drawCounter = 0
    @Published var colorPlayerTurnOff = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    @Published var soundP : AVAudioPlayer!
    
    func restartG() {
            fieldsEasyWay = [[field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)],
            [field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)],
            [field(player: .none, enabled: true),field(player: .none, enabled: true),field(player: .none, enabled: true)]]
        playerTurn = .X
        winner = ""
            winStatus = false
            drawCounter = 0
            colorPlayerTurnOff = Color.white
            changingColor = Color.white
            changingColorBorder = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
           }
    
    func checkWinner (){
        let compare8 = (playerTurn, playerTurn, playerTurn)
             let r1 = (fieldsEasyWay[0][0].player , fieldsEasyWay[0][1].player , fieldsEasyWay[0][2].player) == compare8
             let r2 = (fieldsEasyWay[1][0].player , fieldsEasyWay[1][1].player , fieldsEasyWay[1][2].player) == compare8
             let r3 = (fieldsEasyWay[2][0].player , fieldsEasyWay[2][1].player , fieldsEasyWay[2][2].player) == compare8
             let c1 = (fieldsEasyWay[0][0].player , fieldsEasyWay[1][0].player , fieldsEasyWay[2][0].player) == compare8
             let c2 = (fieldsEasyWay[0][1].player , fieldsEasyWay[1][1].player , fieldsEasyWay[2][1].player) == compare8
             let c3 = (fieldsEasyWay[0][2].player , fieldsEasyWay[1][2].player , fieldsEasyWay[2][2].player) == compare8
             let d1 = (fieldsEasyWay[0][0].player , fieldsEasyWay[1][1].player , fieldsEasyWay[2][2].player) == compare8
             let d2 = (fieldsEasyWay[0][2].player , fieldsEasyWay[1][1].player , fieldsEasyWay[2][0].player) == compare8
             
             if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
                self.winner = ("\(self.playerTurn.textName()) wins")
                 self.winStatus = true
             }
             else if drawCounter == 9 {
                self.winner = ("Draw")
                 self.winStatus = true
             }
         }
    
}
