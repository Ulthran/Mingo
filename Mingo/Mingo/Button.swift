import SpriteKit

class Button: SKNode {
    let onPress: () -> Void
    let label = SKLabelNode(fontNamed: "HoeflerText-BlackItalic")
    let button = SKSpriteNode(imageNamed: "ResizableButton")
    
    init(text:String, color:SKColor, onComplete: () -> Void) {
        onPress = onComplete //set func to be run on button press
        
        //set up the text
        label.text = text
        label.fontColor = SKColor.blackColor()
        label.fontSize = 15
        label.verticalAlignmentMode = .Center
        label.horizontalAlignmentMode = .Center
        label.zPosition = 1
        
        //set up button
        button.color = color
        button.colorBlendFactor = 0.9
        button.centerRect = CGRect(x: 0.42, y: 0.42, width: 0.14, height: 0.14)
        button.xScale = label.frame.width / button.frame.width + 0.3 //txtWidth = x(btnWidth); txtWidth/btnWidth = x; x = scaleFactor
        button.yScale = label.frame.height / button.frame.height + 0.2
        button.zPosition = 0
        
        super.init()
        
        self.userInteractionEnabled = true //allow touch events
        
        self.addChild(button)
        self.addChild(label)
    }
    
    init(img: SKSpriteNode, onComplete: () -> Void) {
        onPress = onComplete
        
        super.init()
        
        self.userInteractionEnabled = true //allow touch events
        
        self.addChild(img)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //log and run OnPress when button is pressed
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Button \(self.name!) pressed.")
        //TODO: play button press sound through AV audio api
        onPress()
    }
}
