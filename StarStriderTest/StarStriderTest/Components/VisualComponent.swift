//
//  VisualComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

public class VisualComponent:GKComponent{
    
    var spriteNode:SKSpriteNode?
    var idleAnim:[SKTexture]?
    var idleAnimTiming:TimeInterval = 0.2
    
    public init(with texture:SKTexture, size:CGSize) {
        super.init()
        self.spriteNode = SKSpriteNode(texture: texture, color: UIColor.blue, size: size)
    }
    
    public init(with texture:SKTexture, size:CGSize, idlesFromAtlas:String) {
        super.init()
        self.spriteNode = SKSpriteNode(texture: texture, color: UIColor.blue, size: size)
        self.idleAnim = Util.createFrames(atlasName: idlesFromAtlas)
    }
    
    public init(with node:SKSpriteNode){
        super.init()
        self.spriteNode = node
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setPosition(pos:CGPoint){
        self.spriteNode?.position = pos
    }
    
    public func setIdleAnimation(idleOn:Bool) {
        if let _ = idleAnim {
            if idleOn {
                self.spriteNode?.run(SKAction.repeatForever(SKAction.animate(with: idleAnim!, timePerFrame: 0.2)), withKey: "idle")
            }
            else {
                self.spriteNode?.removeAction(forKey: "idle")
            }
        }
        else{
            print("This visual component has no textures for idle animation!")
        }
    }
    
}
