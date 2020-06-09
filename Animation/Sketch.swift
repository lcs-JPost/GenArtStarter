import Foundation
import CanvasGraphics

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas: Canvas
    
    // Create an array of many agents
    var agents: [Agent] = []
    
    //create a variable for the distance between two agents
    var Distance = 0
    
    // This function runs once
    override init() {
        
        
        // Create canvas object – specify size
        canvas = Canvas(width: 700, height: 700)
        
        // No fill on canvas
        canvas.drawShapesWithFill = false
        
        
        
        // Create many instances of the Agent structure
        for _ in 1...15 {
            
//            let anotherAgent = Agent(centre: Point(x: canvas.width / 2, y: canvas.height - 20),
//                                     radius: 100,
//                                     velocity: Vector(x: Double.random(in: -2...2),
//                                                      y: Double.random(in: -2...2)),
//                                     drawsUpon: canvas)
            let anotherAgent = Agent(centre: Point(x: Int.random(in: 50...canvas.width - 50), y: Int.random(in: 50...canvas.height - 50)),
                                     radius: 50,
                                     velocity: Vector(x: Double.random(in: -2...2),
                                                      y: Double.random(in: -2...2)),
                                     drawsUpon: canvas)

            agents.append(anotherAgent)
        }
        

        
    }
    
    // This function runs repeatedly, forever, to create the animated effect
    func draw() {
       
//        // Clear the canvas
//        clearCanvas()
        
        // Check here if any agents are overlapping


//        if agents[0].isOverlapping(this: agents[1]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[1].centre)
//        }
//        if agents[0].isOverlapping(this: agents[2]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[2].centre)
//        }
//        if agents[0].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[0].centre, to: agents[3].centre)
//        }
//        if agents[1].isOverlapping(this: agents[2]) {
//            canvas.drawLine(from: agents[1].centre, to: agents[2].centre)
//        }
//        if agents[1].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[1].centre, to: agents[3].centre)
//        }
//        if agents[2].isOverlapping(this: agents[3]) {
//            canvas.drawLine(from: agents[2].centre, to: agents[3].centre)
//        }
//
        for i in 0...agents.count - 2 {
            for j in (i + 1)...agents.count - 1 {
                if agents[i].isOverlapping(this: agents[j]) {
                    Distance = Int(agents[i].distanceBetween(a: agents[i].centre, b: agents[j].centre))
                    canvas.lineColor = Color(hue: 0, saturation: 0, brightness: Int(Distance), alpha: 100)
                    canvas.drawLine(from: agents[i].centre, to: agents[j].centre)
                }
            }
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
        canvas.lineColor = .black
        canvas.defaultLineWidth = 1

    }

}
