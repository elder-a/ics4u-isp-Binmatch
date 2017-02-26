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
        
        var countX = 0
        var countY = 0
        for x in stride(from: 50, through: 400, by: 60){
            countY = 0
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                let square = SKSpriteNode(imageNamed: "Number1")
                square.name = "pineapple"
                square.position = CGPoint(x: CGFloat(x),
                                          y: CGFloat(y)) //sets posistion
                self.addChild(square)
                countY += 1
            }
            countX += 1
        }
        print("\(countX) , \(countY) Counts")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if player.frame.contains(event.location){
        //print(touches)
        let touch = touches.first! as UITouch
        // ...
        if player.frame.contains(touch.location(in: player)){
            print("in object ")
        }
        
        let intX = Int(touch.location(in: player).x)
        let intY = Int(touch.location(in: player).y)
        print("(\(intX) , \(intY)) here are the points in int..")
        
        var arrayXY = findSquare(xVal: intX, yVal: intY)
        print(findSquare(xVal: intX, yVal: intY))
        if arrayXY[0] < 6 {
            newSquare(xVal: arrayXY[0], yVal: arrayXY[1])
        }
    }
    
    func newSquare(xVal: Int, yVal: Int){ //inverts number when clicked on
        var countX = 0
        var countY = 5
        
        
        for y in stride(from: 305, through: 605, by: 60) {
            countX = 0
            // Make sprite objects for various shapes
            for x in stride(from: 50, through: 400, by: 60){
                //countX += 1
                // Define a square
                if xVal == countX && yVal == countY {
                    let  secondNumber = SKSpriteNode(imageNamed: "Number0")
                    secondNumber.position = CGPoint(x: CGFloat(x),
                                              y: CGFloat(y)) //sets posistion
                    //square.
                    self.addChild(secondNumber) //should add to screen
                    print("\(countX) , \(countY) LET INTO Statment")
                }
                countX += 1
            }
            countY -= 1
        }
        print("\(countX) , \(countY) Counts")
    }
}

//-make a funciton that figure out what part of the gird its in
func findSquare(xVal: Int, yVal: Int) -> [Int] {
    //6x6 grid each square takes up 60x60 pixels
    //tops stars from 36 goes to 386 and left from 15
    let startX = 15
    let startY = 36
    let incAm = 60
    var xComp = 0
    var yComp = 0
    var squareX = 0
    var squareY = 0
    var xAndY = [0,0]
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
                    xAndY[0] = squareX
                    xAndY[1] = squareY
                    return xAndY
                    
                }
            }
            yComp = 0
            xComp = 0
            squareX += 1
        }
        squareX = 0
        squareY += 1
    }
    xAndY[0] = 10
    xAndY[1] = 10
    return xAndY
}



//-make a funciton that toggles the sprite?













