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
    //let numberOne =  SKSpriteNode(imageNamed: "Number1")
    //let numberZero =  SKSpriteNode(imageNamed: "Number0")
    var grid : [[Bool]] = [] //array for that repersents grid
    
    let squareSize = 6 //size of square
    
    var playerScore = 0
    var currentNumber = 0
    
    //goals for the player to get
    var lowScore = Int(arc4random_uniform(4))
    var mediumScore = Int(arc4random_uniform(8)+8)
    var topScore = Int(arc4random_uniform(16)+16)
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        for _ in 1...squareSize {
            var gridRow : [Bool] = []
            for _ in 1...squareSize {
                let randInt = (Int(arc4random_uniform(2)))
                if randInt == 0 {
                    gridRow.append(false)
                } else {
                    gridRow.append(true)
                }
            }
            grid.append(gridRow)
        }
        
        print(grid)
        
        //MARK: USE this sections to print off new field if needed
        var countX = 0
        var countY = 0
        for x in stride(from: 50, through: 400, by: 60){
            countY = 0
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                //square.blendMode
                let numberOne =  SKSpriteNode(imageNamed: "Number1")
                let numberZero =  SKSpriteNode(imageNamed: "Number0")
                
                numberOne.position = CGPoint(x: CGFloat(x),
                                             y: CGFloat(y)) //sets posistion
                
                numberZero.position = CGPoint(x: CGFloat(x),
                                              y: CGFloat(y)) //sets posistion
                
                
                if countX < 6 && countY < 6{
                    if grid[countY][countX] == true {
                        self.addChild(numberOne)
                        
                        //grid[countY][countX] = false
                    } else {
                        self.addChild(numberZero)
                    }
                }
                countY += 1
            }
            countX += 1
        }
        //print("\(countX) , \(countY) Counts")
        setupCurrent()
        
    }
    
    func printOn() {
        //MARK: USE this sections to print off new field if needed
        var countX = 0
        var countY = 0
        for x in stride(from: 50, through: 400, by: 60){
            countY = 0
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                // Define a square
                //square.blendMode
                let numberOne =  SKSpriteNode(imageNamed: "Number1")
                let numberZero =  SKSpriteNode(imageNamed: "Number0")
                
                numberOne.position = CGPoint(x: CGFloat(x),
                                             y: CGFloat(y)) //sets posistion
                
                numberZero.position = CGPoint(x: CGFloat(x),
                                              y: CGFloat(y)) //sets posistion
                
                
                if countX < 6 && countY < 6{
                    if grid[countY][countX] == true {
                        self.addChild(numberOne)
                    } else {
                        self.addChild(numberZero)
                    }
                }
                countY += 1
            }
            countX += 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if player.frame.contains(event.location){
        //print(touches)
        let touch = touches.first! as UITouch
        // ...
        if player.frame.contains(touch.location(in: player)){
            //print("in object ")
        }
        
        let intX = Int(touch.location(in: player).x)
        let intY = Int(touch.location(in: player).y)
        //print("(\(intX) , \(intY)) here are the points in int..")
        
        var arrayXY = findSquare(xVal: intX, yVal: intY)
        print(findSquare(xVal: intX, yVal: intY))
        if arrayXY[0] < 6 {
           // newSquare(xVal: arrayXY[0], yVal: arrayXY[1])
            
            //The newSquare funciton it reversed and thats why it worked
            //must do the same for this in or for it to work
            arrayXY[1] = reverse(val: arrayXY[1]) //corrects the x values
            
            if grid[arrayXY[1]][arrayXY[0]] { //should turn to 0
               grid[arrayXY[1]][arrayXY[0]] = false
            } else{
                grid[arrayXY[1]][arrayXY[0]] = true
            }
             //print(grid[arrayXY[0]][arrayXY[1]])
        }
        
        self.removeAllChildren() //removes all nodes from field
        
        print("changed value")
       
        printOn()
        
        //add other funcitons here for other labels
        
        setupCurrent()
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
                    //self.addChild(secondNumber) //should add to screen
                    //print("\(countX) , \(countY) LET INTO Statment")
                }
                countX += 1
            }
            countY -= 1
        }
       // print("\(countX) , \(countY) Counts")
    }
    
    func setupCurrent(){
        let currentLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        currentLabel.text = "Current Number"
        currentLabel.fontColor = SKColor.white
        currentLabel.fontSize = 20
        currentLabel.position = CGPoint(x: size.width*0.75, y: size.height*0.18) // Spaced across middle of scene
        self.addChild(currentLabel)
        
        let NumberLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        NumberLabel.text = String(currentNumber)
        NumberLabel.fontColor = SKColor.white
        NumberLabel.fontSize = 25
        NumberLabel.position = CGPoint(x: size.width*0.75, y: size.height*0.10) // Spaced across middle of scene
        self.addChild(NumberLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        scoreLabel.fontColor = SKColor.white
        scoreLabel.text = "Score"
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width*0.75, y: size.height*0.36) // Spaced across middle of scene
        self.addChild(scoreLabel)
        
        let scoreNumberLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        scoreNumberLabel.fontColor = SKColor.white
        scoreNumberLabel.text = String(playerScore)
        scoreNumberLabel.fontSize = 25
        scoreNumberLabel.position = CGPoint(x: size.width*0.75, y: size.height*0.28) // Spaced across middle of scene
        self.addChild(scoreNumberLabel)
        
        
        
    }
    
    
    func numberField (){

        
        
        
        
        
        
        
        
    }
    
    
    
    
    
}

func reverse(val: Int) -> Int{
    let nice: [Int] = [5, 4, 3, 2, 1, 0]
    return nice[val]
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
                    //print("Found it")
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













