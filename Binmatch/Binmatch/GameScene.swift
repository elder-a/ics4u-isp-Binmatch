//
//  GameScene.swift
//  Binmatch
//
//  Created by Andy-E on 2017-02-13.
//  Copyright © 2017 Andy-E. All rights reserved.
//
//  This  Scene is for the main game and feature the grid and score panel

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "Number1")
    let player2 = SKSpriteNode(imageNamed: "Number0")
    //let numberOne =  SKSpriteNode(imageNamed: "Number1")
    //let numberZero =  SKSpriteNode(imageNamed: "Number0")
    var grid : [[Bool]] = [] //array for that repersents grid
    
    let squareSize = 6 //size of square
    
    var playerScore = 0 //these start at zero
    var currentNumber = 0
    
    //goals for the player to get
    var lowNum = Int(arc4random_uniform(4))  //gives random values to formed numbers
    var mediumNum = Int(arc4random_uniform(8)+8)
    var topNum = Int(arc4random_uniform(16)+16)
    
    var lowTurns = 3 //these are the amount of turns the player has left to get the number
    var mediumTurns = 6
    var topTurns = 9
    
    var clickedCor : [Int] = [10, 10]  //the base reset to zero is 10
    
    override func didMove(to view: SKView) { //this creates the random bool array which the board is based after
        backgroundColor = SKColor.black
        
        
        for _ in 1...squareSize {
            var gridRow : [Bool] = []
            for _ in 1...squareSize {
                let randInt = (Int(arc4random_uniform(2)))
                if randInt == 0 {
                    gridRow.append(false) //creates true or false from the random int
                } else {
                    gridRow.append(true)
                }
            }
            grid.append(gridRow)
        }
        
       // print(grid) //outputs array
        
        //MARK: USE this sections to print off new field if needed
        var countX = 0
        var countY = 0
        for x in stride(from: 50, through: 400, by: 60){
            countY = 0
            // Make sprite objects for various shapes
            for y in stride(from: 305, through: 605, by: 60) {
                
                let numberOne =  SKSpriteNode(imageNamed: "Number1") //creates sprite with correct image
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
        setupCurrent() //setup for board
        numberField() //setup for bottom stuff
        
        
        
        
        
        
        
        
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
                
                
                if countX < 6 && countY < 6{ //this cuts the array to the right side
                    if grid[countY][countX] == true { //and prints array properly
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
        //print(findSquare(xVal: intX, yVal: intY))
        if arrayXY[0] < 6 {
            // newSquare(xVal: arrayXY[0], yVal: arrayXY[1])
            
            //this code alternates the 1 & 0s
            
            /*
             //The newSquare funciton it reversed and thats why it worked
             //must do the same for this in or for it to work
             arrayXY[1] = reverse(val: arrayXY[1]) //corrects the x values
             
             if grid[arrayXY[1]][arrayXY[0]] { //should turn to 0
             grid[arrayXY[1]][arrayXY[0]] = false
             } else{
             grid[arrayXY[1]][arrayXY[0]] = true
             }
             */
            //print(grid[arrayXY[0]][arrayXY[1]])
        }
        
        self.removeAllChildren() //removes all nodes from field
        
        //print("changed value")
        
        printOn()
        
        //add other funcitons here for other labels
        
        
        numberField() //might conasider putting this after as well
        
        numberDecide(xVal: arrayXY[1], yVal: arrayXY[0]) //might need to run this before and other funcitons after
        setupCurrent()
        
        
        if lowTurns < 1 {
            //print("Game over turns ran out") //should send you to another screen
            transisitonS()
            
        } else if mediumTurns < 1{
            //print("Game over turns ran out")
            transisitonS()
            
        } else if topTurns < 1{
            //print("Game over turns ran out")
            transisitonS()
            
        }
        
        //start testing the score here
        
        let defaults = UserDefaults.standard //start value
        
        
        let token = defaults.string(forKey: "MyKey") //reading value from Title Scene
        //print(token)
        
        
        if (playerScore > Int(token!)!) {
            defaults.set(playerScore, forKey: "MyKey") //makes equal to player score if larger
            defaults.synchronize()//wirte value
            
        }
        
        
        
    }
    
    func transisitonS (){
        // Create the menu scene with the same dimensions as the current scene
        let title = TitleScene(size: self.size)
        
        // Configure a transition object to specify the type of animation that handles the move between scenes
        let reveal = SKTransition.doorsCloseHorizontal(withDuration: 1.0)
        
        // Access the current view and present the new scene
        // NOTE: We know the current scene has a view object (since the game is running) so it is safe to force-unwrap the optional view property of the current scene
        self.view!.presentScene(title, transition: reveal)
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
        
        //setup for bottom right of screen
        let currentLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        currentLabel.text = "Current Number"
        currentLabel.fontColor = SKColor.cyan
        currentLabel.fontSize = 20
        currentLabel.position = CGPoint(x: size.width*0.78, y: size.height*0.22) // these are just label for the program 
        self.addChild(currentLabel)
        
        let NumberLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        NumberLabel.text = String(currentNumber)
        NumberLabel.fontColor = SKColor.orange
        NumberLabel.fontSize = 25
        NumberLabel.position = CGPoint(x: size.width*0.78, y: size.height*0.16) // Spaced across middle of scene
        self.addChild(NumberLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        scoreLabel.fontColor = SKColor.cyan
        scoreLabel.text = "Score"
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: size.width*0.78, y: size.height*0.34) // Spaced across middle of scene
        self.addChild(scoreLabel)
        
        let scoreNumberLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
        scoreNumberLabel.fontColor = SKColor.orange
        scoreNumberLabel.text = String(playerScore)
        scoreNumberLabel.fontSize = 25
        scoreNumberLabel.position = CGPoint(x: size.width*0.78, y: size.height*0.28) // Spaced across middle of scene
        self.addChild(scoreNumberLabel)
        
    }
    
    
    func numberField (){
        
        //setup for bottom left of screen
        let gridBehind = SKSpriteNode(imageNamed: "grid back")
        gridBehind.position = CGPoint(x: size.width*0.28, y: size.height*0.27) // Spaced across middle of scene
        self.addChild(gridBehind)
        
        let NumbersTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        NumbersTag.fontColor = SKColor.black
        NumbersTag.text = "Numbers"
        NumbersTag.fontSize = 18
        
        NumbersTag.zPosition = 150  // Make sure the label stays on top of everything else!
        
        NumbersTag.position = CGPoint(x: size.width*0.15, y: size.height*0.36) // Spaced across middle of scene
        self.addChild(NumbersTag)
        
        let TurnsTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        TurnsTag.fontColor = SKColor.black
        TurnsTag.text = "Turns Left"
        TurnsTag.fontSize = 18
        TurnsTag.zPosition = 150  // Make sure the label stays on top of everything else!
        
        TurnsTag.position = CGPoint(x: size.width*0.41, y: size.height*0.36) // Spaced across middle of scene
        self.addChild(TurnsTag)
        
        var localNumber = String(lowNum)
        var localTurns = String(lowTurns)
        let lowTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        lowTag.fontColor = SKColor.white
        lowTag.text = "\(localNumber)                   \(localTurns)"
        lowTag.fontSize = 18
        lowTag.position = CGPoint(x: size.width*0.25, y: size.height*0.17) // Spaced across middle of scene
        self.addChild(lowTag)
        
        localNumber = String(mediumNum)
        localTurns = String(mediumTurns)
        let mediumTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        mediumTag.fontColor = SKColor.white
        mediumTag.text = "\(localNumber)                   \(localTurns)"
        mediumTag.fontSize = 18
        mediumTag.position = CGPoint(x: size.width*0.24, y: size.height*0.23) // Spaced across middle of scene
        self.addChild(mediumTag)
        
        
        localNumber = String(topNum)
        localTurns = String(topTurns)
        let highTag = SKLabelNode(fontNamed: "Helvetica-Bold")
        highTag.fontColor = SKColor.white
        highTag.text = "\(localNumber)                  \(localTurns)"
        highTag.fontSize = 18
        highTag.position = CGPoint(x: size.width*0.25, y: size.height*0.29) // Spaced across middle of scene
        self.addChild(highTag)
        
    }
    
    
    func numberDecide (xVal: Int, yVal: Int){
        //this function tells if its a 10 and splits arrays
        
        //decide what number the user is selecting here and print it to the proper label
        //euther up down left or right after the first selection
        //going to have to use a global varible to hold the prevois click location
        //have one funciton to clear this when rules broken
        //decide in this funciton weather or not to add to row and print to label
        
        
        //use varible clicked core to store values in
        var reset = false //resets array if it finds ten
        for k in clickedCor {
            if k > 8 {
                reset = true
            }
        }
        if xVal == 10 || yVal == 10 { //double check
            reset = true
            
            currentNumber = 0 //just sets current number to 0 when 10 clicked
        }
        
        if reset == true { //if the 10
            //this is first tap or outside tap
            clickedCor.removeAll()
            clickedCor.append(xVal) //adds proper values
            clickedCor.append(yVal)
            //print("Destory old array here is new one \(clickedCor)")
        } else {
            //if any proper point is in a array will launch here
            clickedCor.append(xVal) //add two more values to array
            clickedCor.append(yVal)
            //print("Added array it \(clickedCor)")
            //array starts at bottom left
            
            //the second varible is for the x and first is for y (swapped)
            var corCount = 0
            var xCompare: [Int] = []
            var yCompare: [Int] = []
            for j in clickedCor {
                if corCount % 2 == 1 { //check evens first
                    yCompare.append(j)
                } else {
                    xCompare.append(j)
                }
                corCount += 1
            }
            
            //these are for deciding if the clicks are in the same row or column
            //the first one should be the same as the rest
            var previousValX = yCompare[0]
            for f in yCompare {
                if previousValX == f{
                    //these are in the same column
                    
                } else {
                    //print("not in the same column") //these are not checkinf correclty
                    break
                }
                previousValX = f
            }
            var previousValY = xCompare[0]
            for f in xCompare {
                if previousValY == f{
                    
                    //the values here are in the same row
                } else {
                    //print("not in the same row") //they could be flipped??
                    break
                }
                previousValY = f
            }
            
            //down to third block here
            //print("X array: \(xCompare)")
            //print("Y array: \(yCompare)")
            //second layer of deciding
            rowAndColumnChecker(xArray: xCompare, yArray: yCompare)
            
        }
        
    }
    
    func rowAndColumnChecker(xArray: [Int], yArray: [Int]){
        //check to see if its row, column or nothing dominant
        var Column1Row2Neither0 = 0
        for val in xArray {
            if val == xArray[0] { //
                Column1Row2Neither0 = 2
            } else{
                Column1Row2Neither0 = 0
                break // not row dominant
            }
        }
        if Column1Row2Neither0 == 0 { //only call if not row dominant
            for val in yArray {
                if val == yArray[0] {
                    Column1Row2Neither0 = 1
                } else {
                    Column1Row2Neither0 = 0
                    break //not column dominant
                }
                
                
            }
        }
        //print("Column1, Row2 or Niether: \(Column1Row2Neither0)")
        
        switch Column1Row2Neither0 {
        case 2:
            //only go form left to right
            //this is working
            let arraySize = yArray.count
            let startVal =  yArray[0]
            var rightOrder = false
            for i in 0...yArray.count-1 {//might be off by one
                if yArray[i] == startVal-i {
                    //valid
                    rightOrder = true
                } else {
                    //invalid
                    rightOrder = false
                    break
                }
            }
            //print("this row sequnce is \(rightOrder)")
            
            //call function here to read array values
            //firgue out what the right row
            //and right column are
            if rightOrder {
                countScore(xArray: yArray, yArray: reverseArr(val: xArray)) //still seems to be reverse
                
                //print("X array: \(xArray)")
                //print("Y array: \(yArray)")
                //put here
                
                printBehind(xArray: yArray, yArray: reverseArr(val: xArray)) //should work if
            }
            
        case 1:
            //these needs to be reversed
            let arraySize = xArray.count
            let startVal =  xArray[0]
            var rightOrder = false
            for i in 0...xArray.count-1 {//might be off by one
                if xArray[i] == startVal-i {
                    //valid
                    rightOrder = true
                } else {
                    //invalid
                    rightOrder = false
                    break
                }
            }
            //print("this column sequnce is \(rightOrder)")
            
            
            //call function here to read array values
            if rightOrder {
                //
                countScore(xArray: yArray, yArray: reverseArr(val: xArray)) //is printing correclty
                //the y values are reversed
                //print("X array: \(xArray)")
                //print("Y array: \(reverseArr(val: yArray))")
                
                printBehind(xArray: yArray, yArray: reverseArr(val: xArray)) //could be backwads
                
            }
            
            
        default:
            
            //here the code goes not further and the player restarts
            clickedCor.removeAll() //clear array
        }
        
        
        
    }
    
    func countScore(xArray: [Int], yArray: [Int]){
        //print("New array here: ")
        var decValue = 0
        
        
        
        
        for index in 0...yArray.count-1 {
            
            //print("Here is the grid value: \(grid[yArray[index]][xArray[index]])") //this is very broken
            //the yValues seem backwards
            //could use bit shifting here
            if grid[yArray[index]][xArray[index]] {
                decValue += (1 << index)
            } else {
                //nothing here
            }
        }
        
        currentNumber = decValue //displays in courner
        //print("Here is your decimal Value \(decValue)")
        
        if currentNumber == lowNum {
            playerScore += 10
            lowNum = Int(arc4random_uniform(4))
            turnSub()
            lowTurns = 3
            randomizeGrid(xArray: xArray, yArray: yArray) //could be backwards ???
            //these are if all turns go through
            //Mark: TurnEnd
            
            
        } else if currentNumber == mediumNum {
            playerScore += 50
            mediumNum = Int(arc4random_uniform(8)+8)
            turnSub()
            mediumTurns = 6
            randomizeGrid(xArray: xArray, yArray: yArray) //could be backwards ???
            
            
            
            
            
        } else if currentNumber == topNum {
            playerScore += 100
            topNum = Int(arc4random_uniform(16)+16)
            turnSub()
            topTurns = 9 //might need to change this for difficulty
            randomizeGrid(xArray: xArray, yArray: yArray) //could be backwards ???
            
            
            
            
        } else {
            //do nothing
        }
    }
    func turnSub (){
        lowTurns += -1
        mediumTurns += -1 //basically just subtrack if turn is used
        topTurns += -1
    }
    func randomizeGrid (xArray: [Int], yArray: [Int]){
        for index in 0...yArray.count-1 {
            
            let randomNum = Int(arc4random_uniform(2))
            if randomNum == 1 {
                grid[yArray[index]][xArray[index]] = true
            } else {
                grid[yArray[index]][xArray[index]] = false
            }
            
        }
    }
    
    
    func printBehind(xArray: [Int], yArray: [Int]) {
        //MARK: USE this sections to print off new field if needed
        print("New back: ")
        print("xArray: \(xArray) : yArray: \(yArray)")
        //something is backwards
        var countX = 0
        var countY = 0
        //for yV in yArray {
        //var yV = 0
        var countxV = 0
            for xV in xArray { //this is not looping properly ?????
               
            
                 countX = 0
                 countY = 0
                
                for x in stride(from: 50, through: 400, by: 60){
                    countY = 0
                    
                    // Make sprite objects for various shapes
                    for y in stride(from: 305, through: 605, by: 60) {
                        
              
                        // Define a square
                        //square.blendMode
                        let backSplash =  SKSpriteNode(imageNamed: "back box")
                        //let numberZero =  SKSpriteNode(imageNamed: "Number0")
                        
                        backSplash.position = CGPoint(x: CGFloat(x-12), //might want to move a bit to the side
                            y: CGFloat(y)) //sets posistion
                        backSplash.zPosition = -1 //sourece of problems???
                        
                        if countX < 6 && countY < 6{
                            
                            print(yArray[countxV])
                            
                            if countX == xV && countY == yArray[countxV] { //might need to mess around with this a bit
                               
                                addChild(backSplash)
                                
                            } else {
                                
                            }
                        }
                        countY += 1
                    }
                    countX += 1
                }
                countxV += 1
            }
        }
    }


func reverse(val: Int) -> Int{
    let nice: [Int] = [5, 4, 3, 2, 1, 0]
    return nice[val]
}

func reverseArr(val: [Int]) -> [Int]{
    var finalArr: [Int] = []
    let nice: [Int] = [5, 4, 3, 2, 1, 0]
    for value in val {
        finalArr.append(nice[value])
    }
    return finalArr
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













