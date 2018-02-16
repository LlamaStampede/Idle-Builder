//
//  GameScene.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/4/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import SpriteKit
import GameplayKit

let bankSpacingLeft : CGFloat = 25
let bankSpacingDown : CGFloat = 50

var test : Bool = false

var differences : [CGFloat] = []

var currentXs : [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

var currentMoneyValues : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

class GameScene: SKScene {

    var viewController : SecondViewController?

    var xCoordinate : CGFloat = 0
    var movedXCoord : CGFloat = 0
    var startTime : CGFloat = 0
    var difference : CGFloat = 0
    var quotient : CGFloat = 0

    var bankSprite = Objects(imageNamed: "Bank")
    var bankSprite2 = Objects(imageNamed: "houseOne")
    var bankSprite3 = Objects(imageNamed: "houseOne")
    var bankSprite4 = Objects(imageNamed: "houseOne")

    var one = Objects(imageNamed: "houseOne")
    var two = Objects(imageNamed: "houseOne")
    var three = Objects(imageNamed: "houseOne")
    var five = Objects(imageNamed: "houseOne")
    var four = Objects(imageNamed: "houseOne")

    var firstText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var secondText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var thirdText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var fourthText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var fifthText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var sixthText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var seventhText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var eighthText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)
    var ninthText = MoneyTexts(fontNamed: "Arial", theText: "\(currentMoneyValues[0])", theFontSize: 32)



    override func didMove(to view: SKView) // called when GameScene is called
    {
        backgroundColor = SKColor.blue

        //bankSprite.size = CGSize(width: 200, height: 200)
        bankSprite.position.y += bankSprite.size.height/2
        addChild(bankSprite)

        //bankSprite2.size = CGSize(width: 100, height: 100)
        bankSprite2.position.y += bankSprite2.size.height/2
        addChild(bankSprite2)

        //bankSprite3.size = CGSize(width: 100, height: 100)
        bankSprite3.position.y += bankSprite3.size.height/2
        addChild(bankSprite3)

        //bankSprite4.size = CGSize(width: 100, height: 100)
        bankSprite4.position.y += bankSprite4.size.height/2
        addChild(bankSprite4)

        //one.size = CGSize(width: 100, height: 100)
        one.position.y += one.size.height/2
        addChild(one)

        //two.size = CGSize(width: 100, height: 100)
        two.position.y += two.size.height/2
        addChild(two)

        //three.size = CGSize(width: 100, height: 100)
        three.position.y += three.size.height/2
        addChild(three)

        five.position.y += five.size.height/2
        addChild(five)

        //four.size = CGSize(width: 100, height: 100)
        four.position.y += four.size.height/2
        addChild(four)

        //six.position.y += six.size.height/2
        addChild(firstText)
        addChild(secondText)
        addChild(thirdText)
        addChild(fourthText)
        addChild(fifthText)
        addChild(sixthText)
        addChild(seventhText)
        addChild(eighthText)
        addChild(ninthText)
        /*let score = SKLabelNode(fontNamed: "Arial")
        score.text = "This is a label defined localy and added to a node tree"
        score.name = "score"
        score.fontSize = 35;
        score.fontColor = UIColor.white
        score.position = CGPoint(x:frame.midX, y:frame.midY - 100.0)

        addChild(score)*/

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Began")
        if test == false {
            for t in touches
            {
                //print(t.location(in: view))
                startTime = 0
                quotient = 0
                xCoordinate = 0
                movedXCoord = 0
                let startX = t.location(in: view).x
                for i in objectElements{
                    differences.append(startX - i.position.x)
                    if checkBoundaries(thing: i, coords : t.location(in: view)) == true {
                        currentMoneyValues[i.number-1] += 1
                    }
                }
                difference = startX - bankSprite.position.x
                xCoordinate = startX
                //print("X: Coord", startX)

            }
        }
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Moved")
        if test == false {
            for t in touches
                {
                    var moveX = t.location(in: view).x
                    movedXCoord = moveX - CGFloat(xCoordinate)
                    //print("X: Coord", movedXCoord)
                    for i in objectElements {
                        i.position.x = moveX - differences[i.number-1]
                    }
                    //bankSprite.position.x = moveX - differences[0]
                    //print(differences[0], difference)
                }
        }

    }

    func checkBoundaries(thing : Objects, coords : CGPoint) -> Bool
    {
        var new = size.height - coords.y
        var top = thing.position.y + thing.size.height/2
        var bottom = thing.position.y - thing.size.height/2
        var left = thing.position.x - thing.size.width/2
        var right = thing.position.x + thing.size.width/2
        if new > bottom && new < top && coords.x < right && coords.x > left  {
            //print("in", coords, thing.position, top, bottom, left, right)
            return(true)

        }
        else {
            //print("out")
            return(false)
        }
    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Ended", startTime, movedXCoord)
        if test == false {
            for t in touches
            {
                differences = []
                quotient = movedXCoord / startTime
                //print("Quotient", quotient)
            }
        }

    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Cancelled")
        for t in touches
        {
            //print("X: Coord", xCoordinate, startTime)
            quotient = startTime / xCoordinate
            //print("Quotient", quotient)
        }

    }


    override func update(_ currentTime: TimeInterval) {
        var speed : CGFloat = 1
        //var barrier : CGFloat = size.width * CGFloat(3/4)

        startTime += 1

        for i in objectElements {
            i.position.x += quotient
        }

        if quotient > 0 {
            quotient -= speed
        }
        if quotient < 0 {
            quotient += speed
        }

        if quotient < 1 && quotient > -1 {
            quotient = 0
        }
        for i in objectElements {
            if i.number == amount && i.position.x < size.width * 2/4 { //the last one
                if CGFloat(xCoordinates[amount-1]) <= size.width * 2/4 {
                    for j in objectElements {
                        if j.position.x < CGFloat(xCoordinates[j.number-1]) {
                            j.position.x += 10
                        }
                        if j.position.x > CGFloat(xCoordinates[j.number-1]) {
                            j.position.x -= 10
                        }
                    }
                }
                else {
                    //print("Coord: ", )
                    //print("Before: ", i.position.x)
                    for j in objectElements {
                        //j.position.x = i.texture!.size().width - size.width * 3/4 + CGFloat(xCoordinates[j.number - 1])
                        var wholeWidth = xCoordinates[amount-1] //+ widths[amount-1]
                        j.position.x = CGFloat(xCoordinates[j.number-1]) - CGFloat(wholeWidth) + size.width * 2/4 //whole width of objects + size.width * 3/4?
                        quotient = 0
                    }
                    //print("After: ", i.position.x)
                }
                //for j in objectElements {

                    /*if j.number == amount{
                        j.position.x = size.width * 3/4
                    }
                    else if j.number == 1 {
                        j.position.x = size.width * 3/4 - CGFloat(xCoordinates[amount - 1])
                    }
                    else {*/
                        //print("Aqui: ", j.number)
                    //j.position.x = size.width * 3/4 - CGFloat(xCoordinates[j.number - 1]) //+ CGFloat(xCoordinates[0])
                    /*}*/
                //}
                //var x = "X"
            }
            else if i.number == 1 && i.position.x > CGFloat(xCoordinates[0]) { //the first one
                //test = true
                for j in objectElements {
                    j.position.x = CGFloat(xCoordinates[j.number-1])
                }
            }
            else {
                test = false
            }
            //if i.position.x <
        }
        for i in objectElements {
             currentXs[i.number-1] = i.position.x
        }
        for text in textArray {
            text.position.x = currentXs[text.number]
            text.text = String(currentMoneyValues[text.number])
        }
    }
}
class CubeScene : SKScene {

    var viewController : SecondViewController?
    var front : SKSpriteNode?
    var left : SKSpriteNode?
    var right : SKSpriteNode?

    override func didMove(to view: SKView) {
        front = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 25, height: 25))
        front?.position = CGPoint(x: size.width/2 - 12.5, y: size.height - 12.5)
        front?.zRotation = 50
        addChild(front!)
    }
}
