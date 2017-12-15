//
//  ProjectileLinearComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import GameplayKit

public class ProjectileLinearComponent:GKComponent{
    
    var speed:Double
    var direction:CGVector
    
    public init(speed:Double, direction:CGVector){
        self.speed = speed
        self.direction = direction
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func move(){
        if let spriteComponent = self.entity?.component(ofType: VisualComponent.self){
            spriteComponent.spriteNode?.run(SKAction.move(by: CGVector(dx: direction.dx * 2000, dy: direction.dy * 2000), duration: 2000/speed))
        }
        
    }
    
}
