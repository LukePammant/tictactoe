//
//  TicTacToeBoard.swift
//  TicTacToe
//
//  Created by Software 3tSystems on 12/18/14.
//  Copyright (c) 2014 VitalSignsStudios. All rights reserved.
//

import UIKit

class TicTacToeBoard: UIView {
    
    var boxSize : CGFloat = 0
    var context : CGContext?
    var verticalBuffer : CGFloat = 0
    var horizontalBuffer : CGFloat = 0
    var lineLength : CGFloat = 0
    
    var topLeft, topMiddle, topRight, middleLeft, middleMiddle, middleRight, bottomLeft, bottomMiddle, bottomRight : Bool?
    
    var lastShape = "O"
    
    // nil = empty, true = X, false = O
    
    func drawBoard(width: CGFloat, height: CGFloat){
        // Calculate based off of screen width
        var thirdHeight = height / 3
        var thirdWidth = width / 3

        if height > width {
            lineLength = width
            verticalBuffer = (height - lineLength) / 2
            horizontalBuffer = 0
        } else {
            lineLength = height
            horizontalBuffer = (width - lineLength) / 2
            verticalBuffer = 0
        }
        
        boxSize = lineLength / 3
        
        // draw the board out
        // TODO: Clean this up with initializer
        context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context, UIColor.darkGrayColor().CGColor)
        
        // draw top line
        CGContextMoveToPoint(context, horizontalBuffer, verticalBuffer + boxSize)
        CGContextAddLineToPoint(context, width - horizontalBuffer, verticalBuffer + boxSize)
        
        
        // draw bottom line
        CGContextMoveToPoint(context, horizontalBuffer, verticalBuffer + boxSize * 2)
        CGContextAddLineToPoint(context, width - horizontalBuffer, verticalBuffer + (boxSize * 2))
        
        // draw left line
        CGContextMoveToPoint(context, horizontalBuffer + boxSize, verticalBuffer)
        CGContextAddLineToPoint(context, horizontalBuffer + boxSize, verticalBuffer + lineLength)
        
        // draw right line
        CGContextMoveToPoint(context, horizontalBuffer + (boxSize * 2), verticalBuffer)
        CGContextAddLineToPoint(context, horizontalBuffer + (boxSize * 2), verticalBuffer + lineLength)
        
        CGContextStrokePath(context)
    }
    
    func drawCross(x: CGFloat, y: CGFloat) {
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context, UIColor.darkGrayColor().CGColor)
        
        // place a cross at board location
        CGContextMoveToPoint(context, x, y)
        CGContextAddLineToPoint(context, x + boxSize, y + boxSize)
        
        CGContextMoveToPoint(context, x + boxSize, y)
        CGContextAddLineToPoint(context, x, y + boxSize)

        CGContextStrokePath(context)
    }
    
    func drawCircle(x: CGFloat, y: CGFloat){
        //place a circle at board location
        let rectangle = CGRectMake(x, y, boxSize, boxSize)
        CGContextAddEllipseInRect(context, rectangle)
        CGContextStrokePath(context)
    }
    
    func playerTouchedScreen(touches: NSSet){
        var touch: AnyObject? = touches.anyObject()
        var position = touch!.locationInView(self)
        
        var box = whichBoxWasTouched(position)
        
        // figure out if box has been drawn to
        
        
        // figure out the X and Y of the box to draw to
        
        // if the last move was O then draw X
        // else draw O
    }
    
    func getUpperLeftOfBox() -> (CGFloat, CGFloat) {
        return (0,0)
    }
    
    func whichBoxWasTouched(touchLocation: CGPoint) -> Int {
        if touchLocation.x < horizontalBuffer + boxSize {
            //first row
            if touchLocation.y < verticalBuffer + boxSize {
                //first column
                if lastShape == "O" {
                    drawCross(horizontalBuffer, y: verticalBuffer)
                    lastShape = "X"
                } else {
                    drawCircle(horizontalBuffer, y: verticalBuffer)
                    lastShape = "O"
                }
                return 1
            } else if touchLocation.y < verticalBuffer + boxSize * 2 {
                //second column
                return 2
            } else {
                // third column
                return 3
            }
        } else if touchLocation.x < horizontalBuffer + boxSize * 2 {
            //second row
            if touchLocation.y < verticalBuffer + boxSize {
                //first column
                return 4
            } else if touchLocation.y < verticalBuffer + boxSize * 2 {
                //second column
                return 5
            } else {
                // third column
                return 6
            }
        } else {
            // third row
            if touchLocation.y < verticalBuffer + boxSize {
                //first column
                return 7
            } else if touchLocation.y < verticalBuffer + boxSize * 2 {
                //second column
                return 8
            } else {
                // third column
                return 9
            }
        }
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let screenWidth = rect.width
        let screenHeight = rect.height
        
        drawBoard(screenWidth, height: screenHeight)
        //drawCross(horizontalBuffer, y: verticalBuffer)
       drawCircle(horizontalBuffer, y: verticalBuffer)
        // Drawing code
    }
    

}
