//
//  GameViewController.swift
//  Epic Game iOS
//
//  Created by Garret Carstensen on 8/13/14.
//  Copyright (c) 2014 Garret Carstensen. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* Pick a size for the scene */
//        let scene = GameScene(fileNamed:"GameScene")
        let scene = GameScene(size: CGSize(width: 1000, height: 1000));
        
        // Configure the view.
        let skView = self.view as SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        /* Present the scene */
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var gameScene: GameScene {
        let skView = self.view as SKView
        return skView.scene as GameScene
    }
    
    // MARK: - GameSceneDelegate
    
    func gameScene(gameScene: GameScene, didSetWorld world: World?) {
        if world? != nil && world!.model? != nil {
            // TODO: Display world name
        } else {
            
        }
    }
    
    // MARK: - Interface Builder
    weak var hudViewController: HUDViewController?
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HUD" {
            let viewController = segue.destinationViewController as HUDViewController
            hudViewController = viewController
        }
    }
}
