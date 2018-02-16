//
//  Objects.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/11/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//
/*
 amount += 1

 number = amount
 var xposition : Int = number * Int(bankSpacingLeft)
 if number != 1
 {

 for i in 0...number-1
 {
 xposition += widths[i]
 }
 }
*/
import Foundation
import SpriteKit

var objectElements : [Objects] = []
var xCoordinates : [Int] = []
var widths : [Int] = []
var amount : Int = 0

class Objects : SKSpriteNode {


    var number : Int = 0

    init(imageNamed : String) {
        let texture = SKTexture(imageNamed: "\(imageNamed)")
        amount += 1
        self.number = amount
        super.init(texture: texture, color: UIColor(), size: texture.size())
        widths.append(Int(texture.size().width))
        objectElements.append(self)
        getCoords(number: self.number)

    }
    func test() {
    }
    
    func getCoords(number : Int) {
        var xposition : CGFloat = 0

        xposition += CGFloat(number) * bankSpacingLeft
        if number != 1
        {
            for i in 0...number-2 {
                xposition += CGFloat(widths[i])
                print("HERE: ", widths[i])
            }
        }
        xposition += CGFloat(widths[number-1]/2)
        print(CGFloat(widths[number-1]/2))
        xCoordinates.append(Int(xposition))
        if number == 1 {
            print(xCoordinates)
        }
        self.position.x = CGFloat(xposition)
        //var were = self.texture?.size()
        //print("Size: ", were)
        self.position.y = CGFloat(bankSpacingDown)
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

}
