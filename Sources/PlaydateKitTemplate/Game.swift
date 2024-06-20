import PlaydateKit

// MARK: - Game

final class Game: PlaydateGame {
    // MARK: Internal

    func update() -> Bool {
        Graphics.clear(color: .black)
        
        let poly = Polygon<CInt>(vertices: [
            Point(x: 200, y: 200),
            Point(x: 210, y: 200),
            Point(x: 210, y: 210),
            Point(x: 200, y: 210)
        ])
        Graphics.fillPolygon(poly, color: .white, fillRule: .nonZero)
        
        System.drawFPS()
        return true
    }
}
