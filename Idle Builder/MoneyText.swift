//
//  MoneyText.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/15/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import Foundation
import SpriteKit

var textArray : [MoneyTexts] = []

var textAmounts = 0

class MoneyTexts : SKLabelNode {

    var number : Int = 0

    init (fontNamed:String!, theText: String!, theFontSize: CGFloat!){

        self.number = textAmounts
        super.init()//fontNamed: fontNamed)
        self.text = theText
        self.fontSize = theFontSize
        if self.number > 0 {
            self.position.y = 200
        }
        else {
            self.position.y = 275
        }
        textArray.append(self)
        textAmounts += 1
        //print
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

