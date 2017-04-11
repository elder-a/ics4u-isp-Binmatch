//
//  HowToPlay.swift
//  Binmatch
//
//  Created by Andy-E on 2017-03-30.
//  Copyright © 2017 Andy-E. All rights reserved.
//
// Just a page that shows rthe user how to play with graphics and explanaitons

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
        
        let S7Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S7Tag.fontColor = SKColor.orange
        S7Tag.text = "LSB is always on bottom and right. " //put here
        S7Tag.fontSize = 20
        S7Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.50) // Spaced across middle of scene
        self.addChild(S7Tag)
        
        let S8Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        S8Tag.fontColor = SKColor.orange
        S8Tag.text = "MSB is always on top and left. " //put here
        S8Tag.fontSize = 20
        S8Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.45) // Spaced across middle of scene
        self.addChild(S8Tag)
        
        
        
        let B1Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B1Tag.fontColor = SKColor.green
        B1Tag.text = "Binary: " //put here
        B1Tag.fontSize = 20
        B1Tag.position = CGPoint(x: size.width*0.12, y: size.height*0.35) // Spaced across middle of scene
        self.addChild(B1Tag)
        
        let B2Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B2Tag.fontColor = SKColor.orange
        B2Tag.text = "Binary is base two. We only use 1&0" //put here
        B2Tag.fontSize = 20
        B2Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.30) // Spaced across middle of scene
        self.addChild(B2Tag)
        
        let B3Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B3Tag.fontColor = SKColor.orange
        B3Tag.text = "to repersent numbers. For example" //put here
        B3Tag.fontSize = 20
        B3Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.25) // Spaced across middle of scene
        self.addChild(B3Tag)
        
        let B4Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B4Tag.fontColor = SKColor.orange
        B4Tag.text = "take 5, in binary this is 101. On the" //put here
        B4Tag.fontSize = 20
        B4Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.20) // Spaced across middle of scene
        self.addChild(B4Tag)
        
        let B5Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B5Tag.fontColor = SKColor.orange
        B5Tag.text = "left is the LSB, and on the right is " //put here
        B5Tag.fontSize = 20
        B5Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.15) // Spaced across middle of scene
        self.addChild(B5Tag)
        
        let B6Tag = SKLabelNode(fontNamed: "Helvetica-Bold")
        B6Tag.fontColor = SKColor.orange
        B6Tag.text = "is the MSB-most signicant bit." //put here
        B6Tag.fontSize = 20
        B6Tag.position = CGPoint(x: size.width*0.50, y: size.height*0.10) // Spaced across middle of scene
        self.addChild(B6Tag)
        
        
        
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
