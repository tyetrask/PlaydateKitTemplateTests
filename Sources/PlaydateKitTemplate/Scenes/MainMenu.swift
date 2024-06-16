import PlaydateKit

// OR turn this into a class instead of a struct to 'prevent' crash:
struct Thing {
    let id: String
    let name: String
    let length: Int
    
    init(id: String, name: String, length: Int) {
        self.id = id
        self.name = name
        self.length = length
    }
}

class MainMenu: SceneBase {
    // Comment out this line to 'prevent' the crash:
    var currentThing: Thing = Thing(id: "A", name: "Cool Thing", length: 42)
    var totalElapsed: Float = 0.0
    
    override func onSceneUpdate(deltaTime: Float) {
        totalElapsed += deltaTime
        
        Graphics.clear(color: .white)
        Graphics.fillRect(Rect(x: 20, y: 140, width: CInt(totalElapsed * 10.0), height: 50), color: .black)
    }
}
