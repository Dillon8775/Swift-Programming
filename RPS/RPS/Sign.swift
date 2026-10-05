//
//  Sign.swift
//  RPS
//
//  Created by Dillon Strickland on 10/5/26.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
            case .rock: return "🪨"
            case .paper: return "📝"
            case .scissors: return "✂️"
        }
    }
    
    func getGameState(opponentTurn: Sign) -> GameState {
        switch opponentTurn {
        case .rock:
            switch self {
            case .rock:
                return .draw
            case .paper:
                return .win
            case .scissors:
                return .lose
            }

        case .paper:
            switch self {
            case .rock:
                return .lose
            case .paper:
                return .draw
            case .scissors:
                return .win
            }

        case .scissors:
            switch self {
            case .rock:
                return .win
            case .paper:
                return .lose
            case .scissors:
                return .draw
            }
        }
    }
}
