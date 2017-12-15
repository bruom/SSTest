//
//  GameScene.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var playerEntity : PlayerEntity?
    public var removeComponentSystem = GKComponentSystem(componentClass: RemoveWhenGoneComponent.self)
    public var entities = Set<GKEntity>()
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        playerEntity = PlayerEntity(scene: self)
        
        playerEntity?.addComponent(VisualComponent(with: SKTexture(imageNamed:"ship1"), size: CGSize(width:50.0,height:50.0), idlesFromAtlas: "playerShipAtlas"))
        playerEntity?.addComponent(MoveOnTouchComponent(speed:850))
        playerEntity?.addComponent(AutoFireProjectileComponent(projectile: ProjectileEntity(damage:1, scene:self), fireInterval: 0.2))
//        playerEntity.addComponent(AutoFanFireComponent(projectile: ProjectileEntity(damage:1, scene:self), fireInterval: 0.2))
//        playerEntity.addComponent(AutoRailgunComponent(projectile: ProjectileEntity(damage:1, scene:self), fireInterval: 0.2))
        
        if let visualComponent = playerEntity?.component(ofType: VisualComponent.self){
            self.addChild(visualComponent.spriteNode!)
            visualComponent.setPosition(pos: CGPoint(x: 0, y: -550))
            visualComponent.setIdleAnimation(idleOn: true)
        }
        
        (scene as! GameScene).removeComponentSystem.addComponent(foundIn: playerEntity!)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let controlComponent = playerEntity?.component(ofType: MoveOnTouchComponent.self){
            controlComponent.moveTo(position: pos)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let controlComponent = playerEntity?.component(ofType: MoveOnTouchComponent.self){
            controlComponent.moveTo(position: pos)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    var lastTime:TimeInterval = 0
    override func update(_ currentTime: TimeInterval) {
        var delta:TimeInterval
        if lastTime == 0 {
            delta = 0
        } else {
            delta = currentTime - lastTime
        }
        lastTime = currentTime
        
        for component in playerEntity!.components{
            component.update(deltaTime: delta)
        }
        
        removeComponentSystem.update(deltaTime: delta)
        
    }
}
