//
//  ProjectileFadeComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import GameplayKit

public class ProjectileFadeComponent:GKComponent{
    
    var duration:Double
    var direction:CGVector
    
    public init(duration:Double, direction:CGVector){
        self.duration = duration
        self.direction = direction
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fade(){
        if let spriteComponent = self.entity?.component(ofType: VisualComponent.self){
            spriteComponent.spriteNode?.run(SKAction.fadeOut(withDuration: duration), completion: {
                spriteComponent.spriteNode?.removeFromParent()
            })
        }
        
    }
    
    public func moveToX(pos:CGFloat){
        self.entity?.component(ofType: VisualComponent.self)?.spriteNode!.position.x = pos
    }
    
}
