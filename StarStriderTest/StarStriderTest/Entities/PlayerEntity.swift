//
//  PlayerEntity.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

public class PlayerEntity:GKEntity, RemovableEntity {
    
    var scene:SKScene
    
    public init(scene:SKScene){
        self.scene = scene
        super.init()
        self.addComponent(RemoveWhenGoneComponent())
        (scene as! GameScene).removeComponentSystem.addComponent(foundIn: self)
        (scene as! GameScene).entities.insert(self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func removeEntity(){
        if let sprite = component(ofType: VisualComponent.self)?.spriteNode{
            sprite.removeFromParent()
        }
        (scene as! GameScene).entities.remove(self)
    }
    
}
