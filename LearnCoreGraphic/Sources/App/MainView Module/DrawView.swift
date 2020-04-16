//
//  DrawView.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

@IBDesignable
class DrawView: UIView {

    // MARK: - Properties

    var points: [CGPoint] = []

    var centerPoint: [CGPoint] = []

    var selectedIndex: Int?

    let custom = Custom()

    @IBInspectable var strokeWidth: CGFloat = 0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        points = [custom.pointA, custom.pointB, custom.pointC]
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    // MARK: - Draw

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        drawTriangle(context, points: points)

        drawCircle(context)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        guard screenSize(touch: touch) else { return }
        centerPoint = [touch]
        self.setNeedsDisplay()
        points.enumerated().forEach { (index, point) in
            if distance(from: point, to: touch) <= 20 {
                selectedIndex = index
            }
        }
        guard selectedIndex != nil else { return }
        points[selectedIndex!] = touch
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectedIndex = nil
    }

    // MARK: - Private Functions

    fileprivate func distance(from lhs: CGPoint, to rhs: CGPoint) -> CGFloat {
        let xDistance = lhs.x - rhs.x
        let yDistance = lhs.y - rhs.y
        return (xDistance * xDistance + yDistance * yDistance).squareRoot()
    }

    fileprivate func drawTriangle(_ context: CGContext, points: [CGPoint]) {
        context.addLines(between: points)
        context.closePath()
        context.setLineCap(.square)
        context.setLineWidth(strokeWidth)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }

    fileprivate func drawCircle(_ context: CGContext) {
        guard centerPoint.first != nil else { return }
        context.addArc(center: centerPoint.first!, radius: 10, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(360).degreesToRadians, clockwise: true)
        context.setFillColor(custom.colorCircle)
        context.setLineWidth(7.0)
        context.fillPath()
    }

    private func screenSize(touch: CGPoint) -> Bool {
        return touch.x > self.bounds.minX && touch.y > self.bounds.minY && touch.x < self.bounds.maxX && touch.y < self.bounds.maxY
    }
}
