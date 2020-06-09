//
//  Agent.swift
//  Animation
//
//  Created by Russell Gordon on 2020-05-25.
//  Copyright © 2020 Royal St. George's College. All rights reserved.
//

import Foundation
import CanvasGraphics

class Agent {

    // Agent properties
    var centre: Point
    let radius: Int
    var velocity: Vector
    
    // Canvas the agent will be drawn upon
    var c: Canvas

    // Initialize the agent
    init(centre: Point, radius: Int, velocity: Vector, drawsUpon: Canvas) {
        
        self.centre = centre
        self.radius = radius
        self.velocity = velocity
        self.c = drawsUpon
        
    }
    
    // Update position of agent
    func update() {
        
        // Move the circle
        centre = Point(x: centre.x + velocity.x,
                       y: centre.y + velocity.y)
        
        // bounce at the inner edges
        bounceAtInnerEdges()
        
        // Bounce at edges
        bounceAtEdge()
        

        
        // Draw a circle at this point
        c.drawShapesWithBorders = false
        c.drawEllipse(at: centre, width: radius * 2, height: radius * 2)
        
    }

    // Returns true when this agent is overlapping another agent
    func isOverlapping(this: Agent) -> Bool {
        
        if distanceBetween(a: self.centre, b: this.centre) < CGFloat(self.radius) + CGFloat(this.radius) {
            return true
        } else {
            return false
        }
        
    }
    
    // Finds the distance between this agent and another agent
    func distanceBetween(a: Point, b: Point) -> CGFloat {
        
        return sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
        
    }
    
    // Bounce the agent when it hit's an edge
    func bounceAtEdge() {
        
        // Bounce at left and right edges
        if centre.x + CGFloat(radius) > CGFloat(c.width) || centre.x - CGFloat(radius) < 0 {
            velocity.x *= -1
        }
        
        // Bounce at top and bottom of scren
        if centre.y + CGFloat(radius) > CGFloat(c.height) || centre.y - CGFloat(radius) < 0 {
            velocity.y *= -1
        }

        
    }
    
    //bounce at the borders of the inner square
    func bounceAtInnerEdges() {
        
        // Bounce at top and bottom edges
        if centre.y < CGFloat(c.height) - 250  && centre.y > 250 {
            if centre.x < 450 && centre.x > 250 {
                velocity.y *= -1
            }
        }
        
        // Bounce at left and right edges
            if centre.x < CGFloat(c.width) - 250  && centre.x > 250 {
                if centre.y < 450 && centre.y > 250 {
                    velocity.x *= -1
                    
                }
        }
        
    }
}
    
    

