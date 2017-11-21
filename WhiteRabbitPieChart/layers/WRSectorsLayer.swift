//
//  WRSectorsLayer.swift
//  WhiteRabbitPieChart
//
//  Created by Anastasia Sviridenko on 21/11/2017.
//  Copyright © 2017 ASya. All rights reserved.
//

import UIKit

class WRSectorsLayer: CALayer {
    
    @NSManaged var fillingCoefficient: CGFloat
    var sectors: [WRDrawableSector] = []
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        if let layer = layer as? WRSectorsLayer {
            fillingCoefficient = layer.fillingCoefficient
            sectors = layer.sectors
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Animation
    
    override class func needsDisplay(forKey key: String) -> Bool {
        return key == "fillingCoefficient" ? true : super.needsDisplay(forKey: key)
    }
    
    override func action(forKey event: String) -> CAAction? {
        if event == "fillingCoefficient" {
            let animation = CABasicAnimation(keyPath: event)
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.duration = 0.3
            animation.fromValue = self.presentation()?.fillingCoefficient
            return animation
        }
        return super.action(forKey: event)
    }
    
    //MARK: - Draw
    
    override func draw(in ctx: CGContext) {
        let pi = CGFloat(Double.pi)
        let coefficient = self.presentation()?.fillingCoefficient ?? 0
        
        var startAngle = -pi/2.0
        var endAngle = startAngle
        
        for sector in sectors {
            endAngle = startAngle + pi * 2 * sector.percent * coefficient
            draw(sector: sector, from: startAngle, to: endAngle, in: ctx)
            startAngle = endAngle
        }
    }
    
    private func draw(sector:WRDrawableSector, from startAngle:CGFloat, to endAngle: CGFloat, in ctx: CGContext) {
        
        let radus = min(bounds.width * 0.5, bounds.height * 0.5)
        
        ctx.setFillColor(sector.backgroundColor.cgColor)
        ctx.addArc(center: position, radius: radus, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        ctx.fillPath()
        
        if sector.percent > 5.0 {
            let text = NSString(format: "%.0f%%", sector.percent)
            let attrs = [NSAttributedStringKey.font: sector.font, NSAttributedStringKey.foregroundColor: sector.foregroundColor]
            let bissectAngle = (startAngle + endAngle) * 0.5
            let textCenterX = position.x + radus * cos(bissectAngle) * 0.7
            let textCenterY = position.y + radus * sin(bissectAngle) * 0.7
            //TODO: calculate text size
            text.draw(at: CGPoint(x: textCenterX, y: textCenterY), withAttributes: attrs)
        }
    }
    
    
}
