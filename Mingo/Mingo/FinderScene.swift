import SpriteKit

class FinderScene : SKScene {
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.blackColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        let back = Button(text: "Back", color: SKColor.yellowColor()) { //button to go to game scene
            let scene = MenuScene(size: self.size)
            
            self.view?.presentScene(scene, transition: SKTransition.crossFadeWithDuration(1.0))
        }
        back.position = CGPoint(x: self.frame.minX + 50, y: 3 * self.frame.minY + 30)
        back.name = "Back Button"
        back.zPosition = 3
        
        let text = SKLabelNode(fontNamed: "HoeflerText-BlackItalic")
        text.fontSize = 20
        text.color = SKColor.whiteColor()
        text.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        text.text = "TODO: Implement Finder Scene"
        
        self.addChild(back)
        self.addChild(text)
    }
    
    override func update(currentTime: NSTimeInterval) {
    }
    
    override func willMoveFromView(view: SKView) {
        self.removeAllChildren()
        self.removeFromParent()
    }
}

