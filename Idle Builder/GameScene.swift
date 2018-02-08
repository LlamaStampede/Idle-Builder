//
//  GameScene.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/4/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var xCoordinate : CGFloat = 0
    var movedXCoord : CGFloat = 0
    var startTime : CGFloat = 0
    var difference : CGFloat = 0
    var quotient : CGFloat = 0
    var viewController : SecondViewController?
    private var bankSprite = SKSpriteNode(imageNamed: "Bank")
    let swipeLeftRec = UISwipeGestureRecognizerDirection.left
    let swipeRightRec = UISwipeGestureRecognizerDirection.right
    let bankSpacingLeft : CGFloat = 25
    let bankSpacingDown : CGFloat = 50

    override func didMove(to view: SKView) // called when GameScene is called
    {
        backgroundColor = SKColor.blue



        bankSprite.size = CGSize(width: 200, height: 200)
        bankSprite.position = CGPoint(x: 100 + bankSpacingLeft, y: 100 + bankSpacingDown)
        addChild(bankSprite)

        /*let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)*/
    }

    /*func swipedLeft(sender:UISwipeGestureRecognizer){
        test = true
        //print(sender.location(in: view))
        print("Left")
    }

    func swipedRight(sender:UISwipeGestureRecognizer){
        print("Right")
        //, sender.location(in: view))

    }*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
        for t in touches
        {
            startTime = 0
            quotient = 0
            xCoordinate = 0
            movedXCoord = 0
            var startX = t.location(in: view).x
            difference = startX - bankSprite.position.x
            xCoordinate = startX
            print("X: Coord", startX)
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("Moved")
        for t in touches
            {
                var moveX = t.location(in: view).x
                movedXCoord = moveX - CGFloat(xCoordinate)
                //print("X: Coord", movedXCoord)
                bankSprite.position.x = moveX - difference

            }


    }

    func checkBoundaries(thing : SKSpriteNode)
    {

    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended", startTime, movedXCoord)
        for t in touches
        {
            quotient = movedXCoord / startTime
            print("Quotient", quotient)
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
        startTime += 1
        if quotient > 0 {
            quotient -= 0.5
            bankSprite.position.x += quotient
        }
        if quotient < 0 {
            quotient += 0.5
            bankSprite.position.x += quotient
        }
        if quotient < 1 && quotient > -1 {
            quotient = 0
        }
        if bankSprite.position.x <= bankSpacingLeft + 100 {
            bankSprite.position.x = bankSpacingLeft + 100
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
