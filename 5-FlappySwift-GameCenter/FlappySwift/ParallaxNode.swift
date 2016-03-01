//
//  ParallaxNode.swift
//  FlappySwift
//
//  Created by Giordano Scalzo on 26/08/2014.
//  Copyright (c) 2014 Effective Code. All rights reserved.
//

import SpriteKit

class ParallaxNode {
    private let node: SKSpriteNode!
    
    init(textureNamed: String) {
        let leftHalf = createHalfNodeTexture(textureNamed, offsetX: 0)
        let rightHalf = createHalfNodeTexture(textureNamed, offsetX: leftHalf.size.width)
        
        let size = CGSize(width: leftHalf.size.width + rightHalf.size.width,
            height: leftHalf.size.height)
        
        node = SKSpriteNode(color: UIColor.clearColor(), size: size)
        node.anchorPoint = CGPointZero
        node.position = CGPointZero
        node.addChild(leftHalf)
        node.addChild(rightHalf)
    }
    
    func zPosition(zPosition: CGFloat) -> ParallaxNode {
        node.zPosition = zPosition
        return self
    }
    
    func addTo(parentNode: SKSpriteNode, zPosition: CGFloat) -> ParallaxNode {
        parentNode.addChild(node)
        node.zPosition = zPosition
        return self
    }
}

// Mark: Startable
extension ParallaxNode {
    func start(duration duration: NSTimeInterval) {
        node.runAction(SKAction.repeatActionForever(SKAction.sequence(
            [
                SKAction.moveToX(-node.size.width/2.0, duration: duration),
                SKAction.moveToX(0, duration: 0)
            ]
            )))
    }
    
    func stop() {
        node.removeAllActions()
    }
}

// Mark: Private
private func createHalfNodeTexture(textureNamed: String, offsetX: CGFloat) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: textureNamed, normalMapped: true)
    node.anchorPoint = CGPointZero
    node.position = CGPoint(x: offsetX, y: 0)
    return node
}