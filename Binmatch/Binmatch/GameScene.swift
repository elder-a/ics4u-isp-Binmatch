//
//  GameScene.swift
//  Binmatch
//
//  Created by Andy-E on 2017-02-13.
//  Copyright © 2017 Andy-E. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
let player = SKSpriteNode(imageNamed: "Number1")
let player2 = SKSpriteNode(imageNamed: "Number0")
let player3 = SKSpriteNode(imageNamed: "Number1")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black

        print(size.width)
        player.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        player2.position = CGPoint(x: size.width * 0.29, y: size.height * 0.5)
        player3.position = CGPoint(x: size.width * 0.43, y: size.height * 0.5)
    
        
        addChild(player)
        addChild(player2)
        addChild(player3)
    }
}
