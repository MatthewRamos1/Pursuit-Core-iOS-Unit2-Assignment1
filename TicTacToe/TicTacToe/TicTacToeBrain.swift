//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation
import UIKit

class TicTacToe {
    
    var winningRows = [[GameButton]]()
    
    var xWin = false
    var circleWin = false
    var tie = false
    
    func buttonSorting (_ input: [GameButton]){
        for num in 0...2 {
        var sameColumnArray: [GameButton] = []
        var sameRowArray: [GameButton] = []
            for button in input {
                if button.col == num {
                sameColumnArray.append(button)
                }
                if button.row == num {
                sameRowArray.append(button)
                }
                }
        winningRows.append(sameColumnArray)
        winningRows.append(sameRowArray)
        }
    }
    func diagonalSorting( _ input: [GameButton]) {
        var diagonalArray: [GameButton] = []
        var diagonalArray2: [GameButton] = []
        for button in input {
            if button.tag == 2 || button.tag == 4 || button.tag == 6 {
                diagonalArray.append(button)
            }
            if button.tag == 0 || button.tag == 4 || button.tag == 8 {
                diagonalArray2.append(button)
            }
        }
        winningRows.append(diagonalArray)
        winningRows.append(diagonalArray2)
    }
    
    func gameStatus (_ input: [[GameButton]], _ sender: GameButton, _ board: [GameButton]) {
        var playCounter = 0
        for array in input {
            var xCounter = 0
            var circleCounter = 0
            for button in array {
                if sender.tag == button.tag {
                    button.xMark = sender.xMark
                    button.circleMark = sender.circleMark
                }
                if button.xMark {
                    xCounter += 1
                    
                } else if button.circleMark {
                    circleCounter += 1
                }
            }
            if xCounter == 3 {
                xWin = true
                
            } else if circleCounter == 3 {
                circleWin = true
            }
        }
        for button in board {
            if button.xMark || button.circleMark {
                playCounter += 1
            }
            if playCounter == 9 {
                tie = true
            }
        }
    
    }
    func gameReset () {
        for array in self.winningRows {
            for button in array {
                button.xMark = false
                button.circleMark = false
            }
        }
        circleWin = false
        xWin = false
        tie = false
    }
}
