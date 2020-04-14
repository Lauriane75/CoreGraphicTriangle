import UIKit
import CoreGraphics

//fileprivate func gettouchZonePoints(centerPoint point: CGPoint, and radius: CGFloat, n: Int) -> [CGPoint] {
//      return Array(repeating: 0, count: n).enumerated().map { offset, element in
//          let cgFloatIndex = CGFloat(offset)
//          let radiansStep = CGFloat.pi * CGFloat(2.0) / CGFloat(n)
//          let radians = radiansStep * cgFloatIndex
//          let x = cos(radians) * radius + point.x
//          let y = sin(radians) * radius + point.y
//          return CGPoint(x: x, y: y)
//      }
//  }
//
//  fileprivate func touchZone(position: CGPoint) {
//      let touchZoneLowerLeft = gettouchZonePoints(centerPoint: pointA, and: 5, n: 1000)
//      if touchZoneLowerLeft.contains(position) {
//          print("touch lowerleft")
//      }
//  }

var pointA = CGPoint(x: 25, y: 280)
var pointB = CGPoint(x: 275, y: 280)

   func distance(from lhs: CGPoint, to rhs: CGPoint) -> CGFloat {
          let xDistance = lhs.x - rhs.x
          let yDistance = lhs.y - rhs.y
          return (xDistance * xDistance + yDistance * yDistance).squareRoot()
      }

let dis = distance(from: pointA, to: pointB)
print(dis)

//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touches.enumerated().forEach({ (index, item) in
//            let position = item.location(in: self)
//
//            let leftTouchZone = gettouchZonePoints(centerPoint: lowerleftpoint, and: 10, n: 100)
//            if leftTouchZone.contains(item.location(in: self)) {
//                lowerleftpoint = position
//                print("lowerleftpoint = \(position)")
//                updateDrawing()
//            }
//        })
//    }

//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touches.enumerated().forEach({ (index, item) in
//            let position = item.location(in: self)
//            let leftTouchZone = gettouchZonePoints(centerPoint: lowerleftpoint, and: 10, n: 100)
//            leftTouchZone.enumerated().forEach { (index, item) in
//                if position == item {
//                    lowerleftpoint = position
//                }
//                updateDrawing()
//            }
//            print("touchesMoved = \(position)")
//        })
//    }

