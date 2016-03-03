//
//  GameViewController.swift
//  LivSpel
//
//  Created by Nevyn Bengtsson on 2016-03-02.
//  Copyright (c) 2016 ThirdCog. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size:self.view.frame.size)
		// Configure the view.
		let skView = self.view as! SKView
		skView.showsFPS = true
		skView.showsNodeCount = true
		
		/* Sprite Kit applies additional optimizations to improve rendering performance */
		skView.ignoresSiblingOrder = true
		
		/* Set the scale mode to scale to fit the window */
		scene.scaleMode = .AspectFill
		skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
	
	override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		let skView = self.view as! SKView
		skView.scene!.size = size
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
