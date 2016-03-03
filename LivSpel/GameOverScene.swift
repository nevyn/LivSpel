//
//  GameOverScene.swift
//  LivSpel
//
//  Created by Nevyn Bengtsson on 2016-03-02.
//  Copyright © 2016 ThirdCog. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
	let latestScore = SKLabelNode(fontNamed: "Chalkduster")
	let highestScore = SKLabelNode(fontNamed: "Chalkduster")
	
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Game over!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
		
        latestScore.text = "\(NSUserDefaults.standardUserDefaults().integerForKey("lastScore"))"
        latestScore.fontSize = 25
        latestScore.position = CGPoint(x:CGRectGetMidX(self.frame) - 100, y:CGRectGetMidY(self.frame) - 100)

        highestScore.text = "\(NSUserDefaults.standardUserDefaults().integerForKey("highestScore"))"
        highestScore.fontSize = 25
        highestScore.position = CGPoint(x:CGRectGetMidX(self.frame) + 100, y:CGRectGetMidY(self.frame)  - 100)

        
        self.addChild(myLabel)
		self.addChild(latestScore)
		self.addChild(highestScore)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view!.presentScene(GameScene(size:self.size), transition: SKTransition.doorsOpenHorizontalWithDuration(1))
    }
}
