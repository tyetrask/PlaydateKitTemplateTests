import PlaydateKit

class OtherScene: SceneBase {
    // Comment out this line to 'prevent' the crash:
    var currentThing: Thing = Thing(id: "A", name: "Cool Thing", length: 42)
    var totalElapsed: Float = 0.0
    
    override func onSceneUpdate(deltaTime: Float) {
        totalElapsed += deltaTime
        
        Graphics.clear(color: .black)
        Graphics.fillRect(Rect(x: 20, y: 140, width: CInt(totalElapsed * 10.0), height: 50), color: .white)
    }
}
