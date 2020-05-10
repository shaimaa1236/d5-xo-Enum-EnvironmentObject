//
//  playerEnum.swift
//  d5-xo
//
//  Created by Shaimaa on 5/10/20.
//  Copyright © 2020 Shaimaa. All rights reserved.
//

import Foundation

enum PlayerN {
    case O
    case X
    case none
    
    mutating func toggle (){
        switch self {
        case .O : self = .X
        case .X : self = .O
        case .none : self = .none
        }
    }
    func textName () -> String {
        switch self {
        case .O : return "O"
        case .X : return "X"
        case .none : return ""
        }
    }
}
