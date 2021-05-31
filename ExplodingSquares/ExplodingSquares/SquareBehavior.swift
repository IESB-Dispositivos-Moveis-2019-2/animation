//
//  SquareBehavior.swift
//  ExplodingSquares
//
//  Created by Pedro Henrique on 31/05/21.
//

import UIKit

class SquareBehavior: UIDynamicBehavior {
    
    private var gravity: UIGravityBehavior?
    private var collision: UICollisionBehavior?
    
    override init() {
        super.init()
        
        gravity = UIGravityBehavior()
        gravity?.magnitude = 0.7
        
        collision = UICollisionBehavior()
        collision?.translatesReferenceBoundsIntoBoundary = true
        
        addChildBehavior(gravity!)
        addChildBehavior(collision!)
    }
    
    
    public func addItem(_ item: UIDynamicItem) {
        gravity?.addItem(item)
        collision?.addItem(item)
    }
    
    public func removeItem(_ item: UIDynamicItem) {
        gravity?.removeItem(item)
        collision?.removeItem(item)
    }
    
}
