import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Internal
    func update() -> Bool {
        let randomInt = Int.random(in: 1...3)
        if randomInt == 1 {
            System.log(StaticString("randomInt: 1"))
        } else if randomInt == 2 {
            System.log(StaticString("randomInt: 2"))
        } else if randomInt == 3 {
            System.log(StaticString("randomInt: 3"))
        }
        
        System.drawFPS()
        return true
    }
}
