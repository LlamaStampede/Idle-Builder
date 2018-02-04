//
//  GameViewController.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/4/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var cloudAmount : Int = 0
var teethAmount : Int = 0


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            let scene = SKScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            //scene.backgroundColor = UIColor.red
            view.presentScene(scene)


            view.ignoresSiblingOrder = true

            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    /*@IBAction func startGame(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = UIColor.red
        })
    }*/

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
