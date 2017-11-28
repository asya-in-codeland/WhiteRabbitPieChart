//
//  WRPieChart.swift
//  WhiteRabbitPieChart
//
//  Created by Anastasia Sviridenko on 14/11/2017.
//  Copyright © 2017 ASya. All rights reserved.
//

import UIKit

class WRPieChart: UIView {

    weak var delegate: WRPieChartDelegate?
    weak var dataSource: WRPieChartDataSource?
    
    private let sectorsLayer = WRSectorsLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sectorsLayer.frame = layer.bounds
    }
    
    //MARK: - Public
    
    func update(sectors array: [WRDrawableSector]) {
        sectorsLayer.update(sectors: array)
    }
    
    //MARK: - Private
    
    private func initialSetup() {
        layer.addSublayer(sectorsLayer)
    }
}
