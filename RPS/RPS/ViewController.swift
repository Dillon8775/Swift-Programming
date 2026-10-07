//
//  ViewController.swift
//  RPS
//
//  Created by Dillon Strickland on 10/5/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(.start)
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBAction func doRock(_ sender: Any) {
        turn(.rock)
    }
    @IBAction func doPaper(_ sender: Any) {
        turn(.paper)
    }
    @IBAction func doScissors(_ sender: Any) {
        turn(.scissors)
    }
    
    @IBOutlet weak var getPlayAgain: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        updateUI(.start)
    }
    
    /// Updates the game UI
    func updateUI(_ gameState: GameState) {
        switch gameState {
        case .start:
            appSign.text = "🤖"
            gameStatus.text = "Start"
            getPlayAgain.isHidden = true
            
            rock.isEnabled = true
            paper.isEnabled = true
            scissors.isEnabled = true
            view.backgroundColor = UIColor.white
        case .win:
            gameStatus.text = "You won!"
            view.backgroundColor = UIColor.green
        case .lose:
            gameStatus.text = "You lost!"
            view.backgroundColor = UIColor.red
        case .draw:
            gameStatus.text = "It's a draw!"
            view.backgroundColor = UIColor.yellow
        }
    }
    
    /// Rolls a random sequence for opponent and determines if player won or lost
    func turn(_ selfTurn: Sign) {
        let opponent: Sign = randomSign()
        
        switch selfTurn {
            case .rock:
                if opponent == .rock {
                    updateUI(.draw)
                    print("YES")
                } else if opponent == .paper {
                    updateUI(.lose)
                } else if opponent == .scissors {
                    updateUI(.win)
                }

            case .paper:
                if opponent == .rock {
                    updateUI(.win)
                } else if opponent == .paper {
                    updateUI(.draw)
                } else if opponent == .scissors {
                    updateUI(.lose)
                }

            case .scissors:
                if opponent == .rock {
                    updateUI(.lose)
                } else if opponent == .paper {
                    updateUI(.win)
                } else if opponent == .scissors {
                    updateUI(.draw)
                }
        }
        
        appSign.text = opponent.emoji
        getPlayAgain.isHidden = false
        
        rock.isEnabled = false
        paper.isEnabled = false
        scissors.isEnabled = false
    }
}
