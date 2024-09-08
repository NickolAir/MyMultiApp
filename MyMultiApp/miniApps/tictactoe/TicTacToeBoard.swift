import UIKit

class TicTacToeBoard : UIView{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //line color
        UIColor.black.setStroke()
        
        //line width
        let lineWidth: CGFloat = 5.0
        
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        
        let width = rect.width
        let height = rect.height
        
        let columnWidth = width / 3
        let rowHeight = height / 3
        
        //vertical lines
        for i in 1..<3 {
            let x = columnWidth * CGFloat(i)
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: height))
        }
        
        // horizontal lines
        for i in 1..<3 {
            let y = rowHeight * CGFloat(i)
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: width, y: y))
        }
        
        //draw lines
        path.stroke()
    }
}
