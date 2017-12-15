//
//  RemoveWhenGoneComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import GameplayKit

public class RemoveWhenGoneComponent:GKComponent{
    
    public override func update(deltaTime seconds: TimeInterval) {
        if let visCom = self.entity?.component(ofType: VisualComponent.self){
            if let pos = visCom.spriteNode?.position{
                if pos.y > 1000 || pos.y < -1000 || pos.x > 4000 || pos.x < -4000 {
//                    visCom.spriteNode?.removeFromParent()
                    if let rmv = self.entity as? RemovableEntity {
                        rmv.removeEntity()
                    }
                }
            }
        }
    }
    
}
