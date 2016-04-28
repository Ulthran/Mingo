import SpriteKit

class MenuScene: SKScene {
    let muteSlash = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 5, height: 50))
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.blueColor()
        
        let finder = Button(text: "Find Bathrooms", color: SKColor.blueColor()) { //button to go to bathroom finder scene
            let scene = FinderScene(size: self.size)
            
            self.view?.presentScene(scene, transition: SKTransition.crossFadeWithDuration(1.0))
        }
        finder.position = CGPoint(x: self.frame.midX, y: 3 * self.frame.maxY / 5)
        finder.name = "Game Button" //for debug identification
        finder.zPosition = 3
        //finder.label.fontColor = SKColor.greenColor()
        //Make a get/set for label in Button
        
        let help = Button(text: "Help", color: SKColor.blueColor()) { //button to go to help/info scene
            let scene = HelpScene(size: self.size)
            
            self.view?.presentScene(scene, transition: SKTransition.crossFadeWithDuration(1.0))
        }
        help.position = CGPoint(x: self.frame.midX, y: 2 * self.frame.maxY / 5)
        help.name = "Scores Button"
        help.zPosition = 3
        
        let mute = Button(img: SKSpriteNode(imageNamed: "Mute")) { //button to turn off sound
            Globals.soundOn = !Globals.soundOn
            NSUserDefaults.standardUserDefaults().setBool(Globals.soundOn, forKey:"Mute")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        mute.position = CGPoint(x: self.frame.maxX - 50, y: self.frame.maxY - 50)
        mute.name = "Mute Button"
        mute.zPosition = 3
        
        muteSlash.position = CGPoint(x: mute.position.x + 16, y: mute.position.y - 16)
        muteSlash.fillColor = SKColor.redColor()
        muteSlash.strokeColor = SKColor.clearColor()
        muteSlash.zRotation = CGFloat(M_PI) / 4
        muteSlash.zPosition = 4
        
        self.addChild(finder)
        self.addChild(help)
        self.addChild(mute)
        self.addChild(muteSlash)
    }
    
    override func willMoveFromView(view: SKView) {
        self.removeAllChildren()
        self.removeFromParent()
    }
    
    override func didChangeSize(oldSize: CGSize) {
    }
    
    override func update(currentTime: CFTimeInterval) {
        if Globals.soundOn {
            muteSlash.alpha = 0.0
        } else {
            muteSlash.alpha = 1.0
        }
    }
}
