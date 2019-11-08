//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameButtons: [GameButton]!
    
    @IBOutlet weak var playerStatus: UILabel!
    
    let game = TicTacToe()
    
    var gameRunning = true {
        didSet {
            for button in gameButtons {
                button.isEnabled = gameRunning
            }
        }
    }
    
   
    
  override func viewDidLoad() {
    super.viewDidLoad()
    game.buttonSorting(gameButtons)
    game.diagonalSorting(gameButtons)
    }

    
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        if #available(iOS 13.0, *) {
            if playerStatus.text == "Player 1's Turn" {
                sender.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
                sender.xMark = true
                game.gameStatus(game.winningRows, sender, gameButtons)
                playerStatus.text = "Player 2's Turn"
                
            } else {
                sender.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
                sender.circleMark = true
                game.gameStatus(game.winningRows, sender, gameButtons)
                playerStatus.text = "Player 1's Turn"
        }
            if game.xWin == true {
                playerStatus.text = "Player 1 Wins!"
                gameRunning = false
            } else if game.circleWin == true {
                playerStatus.text = "Player 2 Wins!"
                gameRunning = false
            } else if game.tie == true {
                playerStatus.text = "Tie!"
                gameRunning = false
            }
    }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        for button in gameButtons {
            button.setBackgroundImage(nil, for: .normal)
        }
        game.gameReset()
        gameRunning = true
        playerStatus.text = "Player 1's Turn"
    
    }
    
    
}


