//
//  HowToPlay.swift
//  Binmatch
//
//  Created by Andy-E on 2017-03-30.
//  Copyright © 2017 Andy-E. All rights reserved.
//

import SpriteKit
import GameplayKit


class HowToPlay: SKScene {
    
    let back = SKLabelNode(fontNamed: "Helvetica-Bold")
    //let howToPlay = SKLabelNode(fontNamed: "Helvetica-Bold")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        back.fontColor = SKColor.red
        back.text = "Back" //put here
        back.fontSize = 25
        back.position = CGPoint(x: size.width*0.90, y: size.height*0.95) // Spaced across middle of scene
        self.addChild(back)
        
        
        
    }
    
    // This allows the scene to respond to a touch
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        
        // A touch actually has many points (since a finger is large) so
        // only proceed if we can get the first touch
        guard let touch = touches.first else {
            return
        }
        
        // Get the location of the first touch
        let touchLocation = touch.location(in: self)
        
        if back.frame.contains(touchLocation) {
            print("back")
            
            // Create the menu scene with the same dimensions as the current scene
            let game = TitleScene(size: self.size)
            
            // Configure a transition object to specify the type of animation that handles the move between scenes
            let reveal = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
            
            // Access the current view and present the new scene
            // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
            self.view!.presentScene(game, transition: reveal)
        }
        
    }
}
