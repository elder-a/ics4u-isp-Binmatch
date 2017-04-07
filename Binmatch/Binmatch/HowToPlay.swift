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
    let graphic = SKSpriteNode(imageNamed: "instruc")
    //let howToPlay = SKLabelNode(fontNamed: "Helvetica-Bold")
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        back.fontColor = SKColor.red
        back.text = "Back" //put here
        back.fontSize = 25
        back.position = CGPoint(x: size.width*0.90, y: size.height*0.95) // Spaced across middle of scene
        self.addChild(back)
        
        graphic.position = CGPoint(x: size.width*0.24, y: size.height*0.80) // Spaced across middle of scene
        self.addChild(graphic)
        
        let chooseTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        chooseTag.fontColor = SKColor.green
        chooseTag.text = "Chosing Numbers:" //put here
        chooseTag.fontSize = 20
        chooseTag.position = CGPoint(x: size.width*0.74, y: size.height*0.87) // Spaced across middle of scene
        self.addChild(chooseTag)
        
        let S1Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S1Tag.fontColor = SKColor.orange
        S1Tag.text = "Click one square at a time." //put here
        S1Tag.fontSize = 20
        S1Tag.position = CGPoint(x: size.width*0.60, y: size.height*0.80) // Spaced across middle of scene
        self.addChild(S1Tag)
        
        let S2Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S2Tag.fontColor = SKColor.orange
        S2Tag.text = "All numbers must be in the" //put here
        S2Tag.fontSize = 20
        S2Tag.position = CGPoint(x: size.width*0.60, y: size.height*0.75) // Spaced across middle of scene
        self.addChild(S2Tag)
        
        let S3Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S3Tag.fontColor = SKColor.orange
        S3Tag.text = "same row or column otherwise" //put here
        S3Tag.fontSize = 20
        S3Tag.position = CGPoint(x: size.width*0.60, y: size.height*0.70) // Spaced across middle of scene
        self.addChild(S3Tag)
        
        let S4Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S4Tag.fontColor = SKColor.orange
        S4Tag.text = "no number will show in the current" //put here
        S4Tag.fontSize = 20
        S4Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.65) // Spaced across middle of scene
        self.addChild(S4Tag)
        
        let S5Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S5Tag.fontColor = SKColor.orange
        S5Tag.text = "number field. Get points by making" //put here
        S5Tag.fontSize = 20
        S5Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.60) // Spaced across middle of scene
        self.addChild(S5Tag)
        
        let S6Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S6Tag.fontColor = SKColor.orange
        S6Tag.text = "numbers in binary in the numbers field. " //put here
        S6Tag.fontSize = 20
        S6Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.55) // Spaced across middle of scene
        self.addChild(S6Tag)
        
        
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
