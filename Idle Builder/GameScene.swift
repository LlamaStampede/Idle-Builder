//
//  GameScene.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/4/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import SpriteKitx
import GameplayKit

class GameScene: SKScene {


    var viewController : SecondViewController?

    override func didMove(to view: SKView) // called when GameScene is called
    {
        backgroundColor = SKColor.lightGray


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches
        {
            self.viewController?.goToStoryBoard()
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches
        {



        }

    }

    func checkBoundaries(thing : SKSpriteNode)
    {

    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {


    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }


    override func update(_ currentTime: TimeInterval) {

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
