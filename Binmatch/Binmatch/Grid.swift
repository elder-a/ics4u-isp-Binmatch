//
//  Title Scene.swift
//  Binmatch
//
//  Created by Andy-E on 2017-02-23.
//  Copyright © 2017 Andy-E. All rights reserved.
//

import SpriteKit
import GameplayKit

class Grid {
    
    var number1 = SKSpriteNode(imageNamed: "Number1")
    var number0 = SKSpriteNode(imageNamed: "Number0")
    //var rand = arc4random(Int(2))
    
     init() {
        //print(size.width)
        
        for x in stride(from: 50, through: 400, by: 60){
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                //let  = SKSpriteNode(imageNamed: "Number1")
                number1.name = "pineapple"
                number1.position = CGPoint(x: CGFloat(x),
                                          y: CGFloat(y)) //sets posistion
                
                //SKNode.addChild(number1)
                //SpriteKit.addChild(number1)
            }
        }
    }
}
