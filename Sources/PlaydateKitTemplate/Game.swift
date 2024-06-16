import PlaydateKit

// MARK: - Game

class SceneBase {
    func onSceneUpdate(deltaTime: Float) -> Void {}
}

final class Game: PlaydateGame {
    // MARK: Lifecycle

    var current: SceneBase
    
    init() {
        current = MainMenu()
    }

    // MARK: Internal

    var lastElapsedTime: Float = 0
    var switchSceneTimer: Float = 0
    var sceneType = true // Lazy alternation between scene types

    func update() -> Bool {
        let elapsedTime = System.elapsedTime
        let deltaTime = elapsedTime - lastElapsedTime
        lastElapsedTime = elapsedTime
        
        current.onSceneUpdate(deltaTime: deltaTime)
        
        switchSceneTimer += deltaTime
        if switchSceneTimer > 2.5 {
            System.log(StaticString("Crash is about to happen"))
            current = sceneType ? OtherScene() : MainMenu()
            System.log(StaticString("Crash will have caused this line _not_ to be logged"))
            sceneType.toggle()
            switchSceneTimer = 0
        }

        System.drawFPS()
        return true
    }
}
