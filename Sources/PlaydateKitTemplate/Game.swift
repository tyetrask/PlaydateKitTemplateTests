import PlaydateKit

// Ways to 'prevent' crash:
// 1. Convert Thing from struct to class
// 2. Remove either of the two String properties from Thing struct (???)
// 3. Remove currentThing from SceneWithThing

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

class SceneBase {
    func onSceneUpdate(deltaTime: Float) -> Void {}
}

class SceneWithThing: SceneBase {
    var currentThing: Thing = Thing(id: "A", name: "Cool Thing", length: 42)
    var totalElapsed: Float = 0.0
    
    let bgColor: Graphics.Color
    let color: Graphics.Color
    
    init(bgColor: Graphics.Color, color: Graphics.Color) {
        self.bgColor = bgColor
        self.color = color
    }
    
    override func onSceneUpdate(deltaTime: Float) {
        totalElapsed += deltaTime
        Graphics.clear(color: bgColor)
        Graphics.fillRect(Rect(x: 20, y: 140, width: CInt(totalElapsed * 10.0), height: 50), color: color)
    }
}


final class Game: PlaydateGame {
    var current: SceneBase
    var lastElapsedTime: Float = 0
    var switchSceneTimer: Float = 0
    // Simple way to alternate between scene visual (not required
    // for reproduction, but makes it easier to see scene switches).
    var sceneBackgroundIsBlack = true
    
    init() {
        current = SceneWithThing(bgColor: .white, color: .black)
    }

    func update() -> Bool {
        let elapsedTime = System.elapsedTime
        let deltaTime = elapsedTime - lastElapsedTime
        lastElapsedTime = elapsedTime
        
        current.onSceneUpdate(deltaTime: deltaTime)
        
        switchSceneTimer += deltaTime
        if switchSceneTimer > 2.5 {
            System.log(StaticString("Crash is about to happen"))
            if sceneBackgroundIsBlack {
                current = SceneWithThing(bgColor: .black, color: .white)
            } else {
                current = SceneWithThing(bgColor: .white, color: .black)
            }
            System.log(StaticString("Crash will have caused this line _not_ to be logged"))
            sceneBackgroundIsBlack.toggle()
            switchSceneTimer = 0
        }

        System.drawFPS()
        return true
    }
}
