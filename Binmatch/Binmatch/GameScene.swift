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
        
        //print(size.width)
        player.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        player2.position = CGPoint(x: size.width * 0.29, y: size.height * 0.5)
        
        for x in stride(from: 50, through: 400, by: 60){
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                let square = SKSpriteNode(imageNamed: "Number1")
                square.name = "pineapple"
                square.position = CGPoint(x: CGFloat(x),
                                          y: CGFloat(y)) //sets posistion
                self.addChild(square)
                
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if player.frame.contains(event.location){
        //print(touches)
        var touch = touches.first! as UITouch
        // ...
        if player.frame.contains(touch.location(in: player)){
            print("in object ")
        }
        
        var intX = Int(touch.location(in: player).x)
        var intY = Int(touch.location(in: player).y)
        print("(\(intX) , \(intY)) here are the points in int..")
       
    }
    
    
    
    
    
    
    //        super.touchesBegan(touches, with: event)
    //
    //        let touch: UITouch = (touches.first! as UITouch)
    //
    //
    //        if (touch.view == player.){
    
    //  }
    //for i in event {
    
    //}
    //}
    
    
    
    //     func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    //            let touch:UITouch = touches.anyObject()! as! UITouch
    //            let positionInScene = touch.location(in: self)
    //            let touchedNode = self.atPoint(positionInScene)
    //            print("clicked")
    //            if let name = touchedNode.name
    //            {
    //                if name == "pineapple"
    //                {
    //                    print("Touched")
    //                }
    //            }
    //     }
    
    
    
    //addChild(player)
    //addChild(player2)
    
    
}


