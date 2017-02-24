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

    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black

        print(size.width)
        player.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        player2.position = CGPoint(x: size.width * 0.29, y: size.height * 0.5)
        
        for x in stride(from: 50, through: 400, by: 60){
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                let square = SKSpriteNode(imageNamed: "Number1")
                square.name = "wall square"
                square.position = CGPoint(x: CGFloat(x),
                                          y: CGFloat(y)) //sets posistion
                self.addChild(square)
                
            }
        }

    
        
        
        //addChild(player)
        //addChild(player2)

    }
}
