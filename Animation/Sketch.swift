import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas: Canvas
    
    // Create an array of many agents
    var agents: [Agent] = []
    
    // This function runs once
    override init() {
        
        
        // Create canvas object – specify size
        canvas = Canvas(width: 700, height: 700)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        canvas.lineColor = .blue
        canvas.defaultLineWidth = 10
        
        // Create many instances of the Agent structure
        for _ in 1...4 {
            
//            let anotherAgent = Agent(centre: Point(x: canvas.width / 2, y: canvas.height - 20),
//                                     radius: 100,
//                                     velocity: Vector(x: Double.random(in: -2...2),
//                                                      y: Double.random(in: -2...2)),
//                                     drawsUpon: canvas)
            let anotherAgent = Agent(centre: Point(x: Int.random(in: 100...canvas.width - 100), y: Int.random(in: 100...canvas.height - 100)),
                                     radius: 100,
                                     velocity: Vector(x: Double.random(in: -2...2),
                                                      y: Double.random(in: -2...2)),
                                     drawsUpon: canvas)

            agents.append(anotherAgent)
            
//            // create another origin for instances
//            let anotherAgent2 = Agent(centre: Point(x: canvas.width / 2, y: 20),
//                                     radius: 20,
//                                     velocity: Vector(x: Double.random(in: -2...2),
//                                                      y: Double.random(in: -2...2)),
//                                     drawsUpon: canvas)
//
//            agents.append(anotherAgent2)
        }
        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
       
        // Clear the canvas
        clearCanvas()
        
        // Check here if any agents are overlapping
        canvas.lineColor = .black
        canvas.defaultLineWidth = 1

        if agents[0].isOverlapping(this: agents[1]) {
            canvas.drawLine(from: agents[0].centre, to: agents[1].centre)
        }
        if agents[0].isOverlapping(this: agents[2]) {
            canvas.drawLine(from: agents[0].centre, to: agents[2].centre)
        }
        if agents[0].isOverlapping(this: agents[3]) {
            canvas.drawLine(from: agents[0].centre, to: agents[3].centre)
        }
        if agents[1].isOverlapping(this: agents[2]) {
            canvas.drawLine(from: agents[1].centre, to: agents[2].centre)
        }
        if agents[1].isOverlapping(this: agents[3]) {
            canvas.drawLine(from: agents[1].centre, to: agents[3].centre)
        }
        if agents[2].isOverlapping(this: agents[3]) {
            canvas.drawLine(from: agents[2].centre, to: agents[3].centre)
        }

        
//        //create a big rectangle
//        canvas.drawRectangle(at: Point(x: canvas.width / 2 - 100, y: canvas.height / 2 - 100), width: 200, height: 200)
        
        
        // Update the position of the agent
        for agent in agents {
            agent.update()
        }
        
    }
    
    // Clear the canvas
    func clearCanvas() {

        // "Clear" the canvas after each draw
        canvas.drawShapesWithBorders = false
        canvas.drawShapesWithFill = true
        //canvas.fillColor = .black
        canvas.fillColor = .white
        canvas.drawRectangle(at: Point(x: 0, y: 0), width: canvas.width, height: canvas.height)
        canvas.drawShapesWithFill = false
        canvas.drawShapesWithBorders = true

    }

}
