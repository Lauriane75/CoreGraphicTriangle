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

    var currentAngle: Angle?

    var angles: [CGPoint] = []

    let custom = Custom()

    // MARK: - Draw

    override func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()!

        drawTriangle(context, custom.pointA, custom.pointB, custom.pointC)

        drawCircles(context)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.enumerated().forEach({ (index, item) in
            let position = item.location(in: self)
            if position.x >= custom.pointA.x - 100 || position.y <= custom.pointA.y - 100 {
                currentAngle = .pointA
                custom.pointA = position
                updateDrawing()
            } else if position.x >= custom.pointB.x - 100 || position.y <= custom.pointB.y - 100 {
                currentAngle = .pointB
                custom.pointB = position
                updateDrawing()
            } else if position.x >= custom.pointC.x - 100 || position.y <= custom.pointC.y - 100 {
                currentAngle = .pointC
                custom.pointC = position
                updateDrawing()
            }
        })
    }

    // MARK: - Private Functions

    fileprivate func drawCircles(_ currentContext: CGContext) {
        switch currentAngle {
        case .pointA:
            drawCircle(currentContext, custom.pointA, color: custom.colorA)
        case .pointB:
            drawCircle(currentContext, custom.pointB, color: custom.colorB)
        case .pointC:
            drawCircle(currentContext, custom.pointC, color: custom.colorC)
        case .none:
            break
        }
    }

    fileprivate func updateDrawing() {
        self.setNeedsDisplay()
    }

    fileprivate func drawTriangle(_ context: CGContext, _ lowerLeftCorner: CGPoint, _ lowerRightCorner: CGPoint, _ upperCorner: CGPoint) {
        angles = [custom.pointA, custom.pointB, custom.pointC]
        context.move(to: angles[0])
        context.addLine(to: angles[0])
        context.addLine(to: angles[1])
        context.addLine(to: angles[2])
        context.closePath()

        context.setLineCap(.square)
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }

    fileprivate func drawCircle(_ context: CGContext, _ lowerLeftCorner: CGPoint, color: CGColor) {
        context.addArc(center: lowerLeftCorner, radius: 10, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(360).degreesToRadians, clockwise: true)
        context.setFillColor(color)
        context.setLineWidth(7.0)
        context.fillPath()
    }
}

