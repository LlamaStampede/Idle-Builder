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

class GameScene: SKScene {

    var viewController : SecondViewController?

    var xCoordinate : CGFloat = 0
    var movedXCoord : CGFloat = 0
    var startTime : CGFloat = 0
    var difference : CGFloat = 0
    var quotient : CGFloat = 0

    var bankSprite = Objects(imageNamed: "Bank")
    var bankSprite2 = Objects(imageNamed: "Spaceship")
    var bankSprite3 = Objects(imageNamed: "Spaceship")
    var bankSprite4 = Objects(imageNamed: "Spaceship")

    var one = Objects(imageNamed: "Spaceship")
    var two = Objects(imageNamed: "Spaceship")
    var three = Objects(imageNamed: "Spaceship")
    var four = Objects(imageNamed: "Spaceship")



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

        //four.size = CGSize(width: 100, height: 100)
        four.position.y += four.size.height/2
        addChild(four)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Began")
        if test == false {
            for t in touches
            {
                startTime = 0
                quotient = 0
                xCoordinate = 0
                movedXCoord = 0
                var startX = t.location(in: view).x
                for i in objectElements{
                    differences.append(startX - i.position.x)
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

    func checkBoundaries(thing : SKSpriteNode)
    {

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
        print("Cancelled")
        for t in touches
        {
            print("X: Coord", xCoordinate, startTime)
            quotient = startTime / xCoordinate
            print("Quotient", quotient)
        }

    }


    override func update(_ currentTime: TimeInterval) {
        var speed : CGFloat = 1

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
            if i.number == amount && i.position.x < size.width * 3/4 { //the last one
                //test = true
                print("Before: ", i.position.x)
                for j in objectElements {
                    j.position.x = i.texture!.size().width - size.width * 3/4 + CGFloat(xCoordinates[j.number - 1])
                    quotient = 0
                }
                print("After: ", i.position.x)
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
