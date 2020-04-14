//
//  DrawView.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class DrawView: UIView {

    // MARK: - Properties

    var points: [CGPoint] = []

    var centerPoint: [CGPoint] = []

    let custom = Custom()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        points = [custom.pointA, custom.pointB, custom.pointC]
    }

    // MARK: - Draw

    override func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()!

        drawTriangle(context, points: points)

        drawCircle(context)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: self) else { return }
        centerPoint = [touch]
        points.enumerated().forEach { (index, item) in
            if distance(from: item, to: touch) <= 20 {
                points[index] = touch
            }
        }
        self.setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

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
        context.setLineWidth(5.0)
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
}
