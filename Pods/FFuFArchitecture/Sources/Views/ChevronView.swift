//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/25/17.
//  Licensed under the MIT license. See LICENSE file
//

import UIKit

/**
 ChevronView is a class that displays an up, down, left or right arrow using a UIBezierPath.
*/
open class ChevronView: UIView {
    /**
     Enum that represents which direction the chevron will point to
    */
    public enum Direction {
        case up
        case down
        case left
        case right
    }

    // MARK: Initializer
    /**
     Initializer for a ChevronView
     - parameter frame: The size and location of the ChevronView
     - parameter direction: The initial direction of where the chevron will point
    */
    public init(frame: CGRect, direction: ChevronView.Direction) {
        self.direction = direction
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Stored Properties
    /**
     The direction of where the chevron currently points. Mutating this variable triggers a setNeedDisplay method call
    */
    open var direction: ChevronView.Direction {
        didSet {
            DispatchQueue.main.async {
                self.setNeedsDisplay()
            }
        }
    }

    private var path: UIBezierPath = {
        let path: UIBezierPath = UIBezierPath()
        return path
    }()

    private var _lineWidth: CGFloat = 2.0 {
        didSet {
            self.path.lineWidth = self._lineWidth
        }
    }

    private var _lineColor: UIColor = UIColor.black

    /**
     The line width of the chevron.
    */
    open var lineWidth: CGFloat {
        get { return self._lineWidth }

        set { self._lineWidth = newValue }
    }

    /**
     The color of the chevron.
    */
    open var lineColor: UIColor {
        get { return self._lineColor }

        set { self._lineColor = newValue }
    }

    private func drawChevron(with color: UIColor) {
        self.path.removeAllPoints()
        self.path = UIBezierPath()
        self.path.lineWidth = self._lineWidth
        color.set()

        let scaleConstant: CGFloat

        switch self.direction {
        case .up, .down:
            scaleConstant = self.bounds.height

        case .left, .right:
            scaleConstant = self.bounds.width
        }

        let offset: CGFloat = scaleConstant * 0.25

        let origin: CGPoint
        let secondPoint: CGPoint
        let thirdPoint: CGPoint

        switch self.direction {
            case .up:
                origin = CGPoint(x: 1.0, y: self.bounds.midY + offset)
                secondPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY - offset)
                thirdPoint = CGPoint(x: self.bounds.width - origin.x, y: self.bounds.midY + offset)

            case .down:
                origin = CGPoint(x: 1.0, y: self.bounds.midY - offset)
                secondPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY + offset)
                thirdPoint = CGPoint(x: self.bounds.width - origin.x, y: self.bounds.midY - offset)

            case .right:
                origin = CGPoint(x: self.bounds.midX - offset, y: 1.0)
                secondPoint = CGPoint(x: self.bounds.midX + offset, y: self.bounds.midY)
                thirdPoint = CGPoint(x: self.bounds.midX - offset, y: self.bounds.height - origin.y)

            case .left:
                origin = CGPoint(x: self.bounds.midX + offset, y: 1.0)
                secondPoint = CGPoint(x: self.bounds.midX - offset, y: self.bounds.midY)
                thirdPoint = CGPoint(x: self.bounds.midX + offset, y: self.bounds.height - origin.y)
        }

        // Map the points of UIBezierPath
        self.path.move(to: origin)
        [secondPoint, thirdPoint].forEach {
            self.path.addLine(to: $0)
        }

        self.path.stroke()
    }

    // MARK: Overridden UIKit methods
    open override func draw(_ rect: CGRect) {
        self.drawChevron(with: self._lineColor)
    }

}
