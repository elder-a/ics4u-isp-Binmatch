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
        //player.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        //player2.position = CGPoint(x: size.width * 0.29, y: size.height * 0.5)
        
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
        
        print(findSquare(xVal: intX, yVal: intY))
        
    }
    
    //-make a funciton that figure out what part of the gird its in
    func findSquare(xVal: Int, yVal: Int) -> Int {
        //6x6 grid each square takes up 60x60 pixels
        //tops stars from 36 goes to 386 and left from 15
        let startX = 15
        let startY = 36
        let incAm = 60
        var xComp = 0
        var yComp = 0
        var squareCount = 0
        for y in 0...5{
            for x in 0...5{
                //check for values here
                
                xComp = startX+(incAm*x)//lower boundries
                yComp = startY+(incAm*y)//lower boundries
                let xCompUp = xComp+60 //upper boundries
                let yCompUp = yComp+60
                
                if xVal > xComp && xVal < xCompUp {
                    if yVal > yComp && yVal < yCompUp{
                        print("Found it")
                        return squareCount
                        
                    }
                }
                yComp = 0
                xComp = 0
                squareCount += 1
            }
        }
        return squareCount
    }
    
    
    
    
    
    
    
    //-make a funciton that toggles the sprite?
    
    
    
    
    
    
    
    
    
    
}


