import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    func update() -> Bool {
        
        let string1 = "Hello 👾"
        let string2 = "There 🤖"
        
        if string1 == string2 {
            System.log(StaticString("Hooray!"))
        } else {
            System.log(StaticString("Oh no!"))
        }
        
        System.drawFPS()
        return true
    }
}
