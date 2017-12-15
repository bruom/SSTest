//
//  Util.swift
//  StarStriderTest
//
//  Created by Bruno Omella Mainieri on 15/12/17.
//  Copyright © 2017 Bruno Omella Mainieri. All rights reserved.
//

import Foundation
import SpriteKit

public class Util {
    
    public static func createFrames(atlasName:String) -> [SKTexture] {
        let textureAtlas = SKTextureAtlas(named: atlasName)
        var frames = [SKTexture]()
        for i in 1...textureAtlas.textureNames.count - 1{
            frames.append(textureAtlas.textureNamed(textureAtlas.textureNames[i]))
        }
        return frames
    }

    
}
