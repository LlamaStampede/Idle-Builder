//
//  SecondViewController.swift
//  Idle Builder
//
//  Created by Lembck, Michael on 2/4/18.
//  Copyright © 2018 Lembck, Michael. All rights reserved.
//

import UIKit
import GameKit
import SpriteKit
class SecondViewController: GameViewController {


    //@IBOutlet weak var mainMenuOutlet: UIButton!
    @IBOutlet weak var mainMenuOutlet: UIButton!
    var game : SKView?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let game = self.view as! SKView?
        {
            let scene2 = GameScene(size: game.bounds.size)
            scene2.scaleMode = .aspectFill
            scene2.viewController = self
            game.presentScene(scene2)
            mainMenuOutlet.isHidden = true

        }
    }
    /*
     game.showsFPS = true
     game.showsNodeCount = true
     game.isHidden = false
     print("Working")
     */
    // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func mainMenuAction(_ sender: Any) {

    }
    func goToStoryBoard()
    {
        if let game = self.view as! SKView?
        {
            let scene2 = SKScene(size: game.bounds.size)
            scene2.scaleMode = .aspectFill
            scene2.backgroundColor = UIColor.cyan
            game.presentScene(scene2)
            mainMenuOutlet.isHidden = false
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
