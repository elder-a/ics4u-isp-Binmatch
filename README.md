# Grade 12 Computer Science ISP

Overall expectations being assessed in this independent study project:

* A1. 	demonstrate the ability to use different data types and expressions when creating computer programs;
* A2. 	describe and use modular programming concepts and principles in the creation of computer programs;
* A4. 	use proper code maintenance techniques when creating computer programs.
* B1. 	demonstrate the ability to manage the software development process effectively, through all of its stages – planning, development ... and closing;
* B2. 	apply standard project management techniques in the context of a student-managed ... project.
* C1. 	demonstrate the ability to apply modular design concepts in computer programs;

In all phases of this ISP, you will be guided by an exemplar produced by Mr. Gordon.

The emphasis in this ISP is on understanding and applying the process of software development. The greatest success has historically come to students who plan their deliverables according to a manageeable schedule and stick to their plan.

## Scope

Aim to create a modest application that solves a problem you care about. If you solve the problem well, it is highly likely that others will find your application useful as well. Challenge yourself with something new, but avoid overreaching.

## Due dates

Planning, development, and closing will occur by the start of March Break. You can set due dates for deliverables in your project. You are strongly recommended to plan deliverable dates by working around due dates for deliverables in your other classes.

Note that you will be granted significant opportunities to work in class, but that there is, like any Grade 12 university preparation course, an expectation that work be completed outside of class time as well.

## Proposal

Modify this document and add your responses to the following prompts below.

### What problem will your application solve?

*Write a paragraph to describe the utility of your application. This applies equally for games. When would someone use your application? Why would they use your application?*

My app would simply be a game and this is meant for me or anyone to use on the subway when they are bored. I often find myself on the subway alone after school and crave a game I could play with one hand while I am stadning up. People could use my appliciton becuase it will be a simple but fun to play. 

### What is your inspiration for this project?

*Have you seen another application that you wish to improve on? Has someone asked you to create this?*

This cames from all the time when I am sitting on the subway and I am bored all by myself and want something to do and a simple game would make me happy. As well, after playing games like Brick Breaker it got me thinking about simple puzzle games that I could play whenever I wanted. 

### What is your prior experience in this area?

*Have you written an application like this before? Have you made use of any required APIs before?*

I have not written any games like this and I will use SpriteKit which will be entirely new to me. As well, I have never worked on a game in any other languages so this will be a entirly new challenge for me. 

### What are skills do you hope to acquire by completing this project?

*For example, you might be writing a networked application for the first time. Or, you may be writing an application that requires a particularly well designed user interface. Describe what you expect to learn by writing this application.*

I want to increase my understanding of classes as well as game functionality as I had not really made many programs in the forms of games. I want to orginize my code better as well, the create process for me making a game will also be a new experance. 

### What dependencies, if any, will be required to complete your project?

*If you are writing a networked application, you might be using an API like Alamofire to simplify that part of the implementation. If you are writing an application that communicates over Bluetooth, you may be using the Core Bluetooth framework. Please list any expected dependencies for your project.*

SpriteKit

### Rate the personal difficulty level of this project.

I think that I should be able to complete but the main thing being I must learn a totally new API : SpriteKit. I think this will be a pretty big challenge for me as I don't have a lot of experience with writing games. 

### Identify what you think your biggest challenge for successfully completing this ISP will be.

I think it will be tough getting to use SpriteKit but as well jumping into something original right off the bat.  

### Make storyboards to indicate the user interface and/or functionality of your application.

*In the section below, sketch out a plan for your application. This is where you will spend the majority of your time in completing the ISP proposal. Think through what you hope to create and as needed, adjust your responses to the questions above.*

Title Screen: 
![Title](https://github.com/rsgc-elder-a/ics4u-isp-Binmatch/blob/master/Binmatch/Title%20Screen.jpg?raw=true)

This screen is very simple. It consists of the title, play button and highscore. The play button simply starts the game and sends you to the game screen

Game Screen:
![Game](https://github.com/rsgc-elder-a/ics4u-isp-Binmatch/blob/master/Binmatch/Game%20Screen.jpg?raw=true)
Here is the game loop.

Grid: 

This is where the gameplay happens. The player tries to produce one of the three numbers in the Number Field by choosing bits in a row or column and scores points depending on how large the number is. The numbers are read from right to left; right being the least significant bit. When choosing numbers in columns its read down-up being the farthest down bit is the least significant bit. 

Numbers Field:

This is where numbers and turns left values are. The numbers column is where the numbers the players tries to make using the grid above reside. The turns left corresponds to the number beside it. These are how many turns left the player has to produce the number beside or it will result in a return to the title screen and a game over. 

Highscore Field: 

Displays the highscore.

Current Number Field:

Displays the current number the player is trying to make due to the numbers they have selected in the grid. 

Highlighted grid: 

![Grid](https://github.com/rsgc-elder-a/ics4u-isp-Binmatch/blob/master/Binmatch/Highlighted%20Grid.jpg?raw=true)

Here is a example of how the user would interact with the game, they would highlight a row or column making a number that appears. This will cause the grid to randomly generate more numbers where the number was just made. Here we use the example 8 as its one of the answers. 
