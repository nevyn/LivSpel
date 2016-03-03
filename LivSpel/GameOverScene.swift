//
//  GameOverScene.swift
//  LivSpel
//
//  Created by Nevyn Bengtsson on 2016-03-02.
//  Copyright © 2016 ThirdCog. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Game over!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view!.presentScene(GameScene(size:self.size), transition: SKTransition.doorsOpenHorizontalWithDuration(1))
    }
}
