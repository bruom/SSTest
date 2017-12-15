//
//  MoveOnTouchComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

public class MoveOnTouchComponent:GKComponent {
    
    var moveSpeed:Double = 100
    
    public init(speed:Double){
        self.moveSpeed = speed
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func moveTo(position:CGPoint){
        if let spriteComponent = self.entity?.component(ofType: VisualComponent.self){
            
            let curX = spriteComponent.spriteNode?.position.x
            let dist = abs(curX! - position.x)
            
            spriteComponent.spriteNode?.run(SKAction.moveTo(x: position.x, duration: TimeInterval(Double(dist)/moveSpeed)))
        }
    }
    
}
