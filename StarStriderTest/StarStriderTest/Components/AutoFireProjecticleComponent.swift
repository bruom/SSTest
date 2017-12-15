//
//  AutoFireProjecticleComponent.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import GameplayKit

public class AutoFireProjectileComponent:GKComponent{
    
    var cooldown:TimeInterval
    var projectile:ProjectileEntity
    
    
    public init(projectile:ProjectileEntity, fireInterval:TimeInterval) {
        self.projectile = projectile
        self.cooldown = fireInterval
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fire(){
        let proj:ProjectileEntity = self.projectile.createCopy()
        proj.addComponent(VisualComponent(with: SKTexture(imageNamed:"shot1"), size: CGSize(width:20,height:20)))
        proj.component(ofType: VisualComponent.self)?.setPosition(pos: (self.entity?.component(ofType: VisualComponent.self)?.spriteNode?.position)!)
        
        proj.scene.addChild((proj.component(ofType: VisualComponent.self)?.spriteNode)!)
        
        proj.addComponent(ProjectileLinearComponent(speed: 1050, direction: CGVector(dx: 0, dy: 1)))
        proj.component(ofType: ProjectileLinearComponent.self)?.move()
        
        
    }
    
    var curCooldown:TimeInterval = 0
    public override func update(deltaTime seconds: TimeInterval) {
        curCooldown -= seconds
        if curCooldown <= 0 {
            fire()
            curCooldown = cooldown
        }
    }
    
}
