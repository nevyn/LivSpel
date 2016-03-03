//
//  GameScene.swift
//  LivSpel
//
//  Created by Nevyn Bengtsson on 2016-03-02.
//  Copyright (c) 2016 ThirdCog. All rights reserved.
//

import SpriteKit

enum CollisionMask : UInt32 {
	case Player = 1
	case Enemy = 2
}

class GameScene: SKScene, SKPhysicsContactDelegate {
	
	let bg = SKSpriteNode(imageNamed: "bg")
	let liv = SKSpriteNode(imageNamed: "liv")
	var freddys : [SKSpriteNode] = []
	
	let scoreLabel = SKLabelNode(fontNamed:"Courier-Bold")
	
    override func didMoveToView(view: SKView) {
		scoreLabel.fontSize = 200;
		scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
		scoreLabel.fontColor = SKColor(hue: 0, saturation: 0, brightness: 1, alpha: 0.3)
		scoreLabel.text = "00";
		self.addChild(scoreLabel)

	
		liv.size = CGSize(width: 100, height: 100)
		liv.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
		
		let livBody = SKPhysicsBody(circleOfRadius: 50)
		livBody.mass = 10000000;
		livBody.categoryBitMask = CollisionMask.Player.rawValue
		livBody.contactTestBitMask = CollisionMask.Enemy.rawValue
		livBody.affectedByGravity = false
		liv.physicsBody = livBody
		
		self.addChild(liv)
		
		bg.zPosition = -1000
		bg.position = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
		self.addChild(bg)
		
		for name in ["chica", "foxy", "bonnie", "puffle", "lolbit"] {
			let freddy = SKSpriteNode(imageNamed: name)
			freddy.size = CGSize(width: 60, height: 60)
			let freddyBody = SKPhysicsBody(circleOfRadius: 30)
			freddyBody.mass = 1000;
			freddyBody.categoryBitMask = CollisionMask.Enemy.rawValue
			freddyBody.contactTestBitMask = CollisionMask.Player.rawValue
			freddyBody.affectedByGravity = true
			freddy.physicsBody = freddyBody
			
			freddys.append(freddy)
			self.addChild(freddy)
		}
		
		self.physicsWorld.gravity = CGVectorMake(0, -10)
        self.physicsWorld.contactDelegate = self
    }
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.touchesMoved(touches, withEvent: event)
}
	
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
		let location = touches.first!.locationInNode(self)
		liv.position = location
    }
	
	var last : CFTimeInterval = 0
	var score = 0
    override func update(currentTime: CFTimeInterval) {
		if freddys.count == 0 {
			return
		}
		
		let diff = currentTime - last
		if diff > 1 {
			last = currentTime
			
			let freddy = freddys[Int(arc4random_uniform(UInt32(freddys.count)))]
			freddy.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(self.size.width-60))), y: self.size.height)
			freddy.physicsBody!.velocity = CGVector()
			
			score = score + 1
			self.scoreLabel.text = "\(score)"

		}
    }
	
	func didBeginContact(contact: SKPhysicsContact) {
		self.view!.presentScene(GameOverScene(size:self.size), transition: SKTransition.doorsCloseHorizontalWithDuration(1))
	}

}
