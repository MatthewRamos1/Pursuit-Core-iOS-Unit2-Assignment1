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
    
   
    
  override func viewDidLoad() {
    super.viewDidLoad()
    for num in 0...2 {
        game.colButtonSorting(gameButtons, num)
        game.rowButtonSorting(gameButtons, num)
    }
    
  }
    

    
    @IBAction func gameButtonPressed(_ sender: GameButton) {
        if #available(iOS 13.0, *) {
            if playerStatus.text == "Player 1's Turn" {
                sender.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
                sender.xMark = false
                playerStatus.text = "Player 2's Turn"
            } else {
                sender.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
                sender.circleMark = true
                playerStatus.text = "Player 1's Turn"
        }
    }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        for button in gameButtons {
            button.setBackgroundImage(nil, for: .normal)
        }
        playerStatus.text = "Player 1's Turn"
    }
    
    
}


