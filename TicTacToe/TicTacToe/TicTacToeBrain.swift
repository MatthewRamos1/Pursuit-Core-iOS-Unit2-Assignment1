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
    
    var columnsAndRows = [[GameButton]]()
    
    var xWin = false
    var circleWin = false
    func colButtonSorting (_ input: [GameButton],_ column: Int){
        var sameColumnArray: [GameButton] = []
        for button in input {
            if button.col == column {
                sameColumnArray.append(button)
            }
        }
        columnsAndRows.append(sameColumnArray)
    }
    
    func rowButtonSorting (_ input: [GameButton],_ row: Int){
        var sameRowArray: [GameButton] = []
        for button in input {
            if button.row == row {
                sameRowArray.append(button)
            }
        }
        columnsAndRows.append(sameRowArray)
    }
    
    func gameStatus (_ input: [[GameButton]],_ sender: GameButton) {
        
        for array in input {
            var xCounter = 0
            var circleCounter = 0
            for button in array {
                if button.xMark == true {
                    xCounter += 1
                    
                } else if button.circleMark == true {
                circleCounter += 1
                    
                }
                
            }
            if xCounter == 3 {
                self.xWin = true
                
            } else if circleCounter == 3 {
                self.circleWin = true
        }
    }
}
}
