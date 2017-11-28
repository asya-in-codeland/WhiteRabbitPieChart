//
//  ViewController.swift
//  WhiteRabbitPieChart
//
//  Created by Anastasia Sviridenko on 14/11/2017.
//  Copyright © 2017 ASya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var piechart: WRPieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        piechart = WRPieChart(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        piechart.backgroundColor = UIColor.lightGray
        view.addSubview(piechart)
        
        let button = UIButton(frame: CGRect(x: 10, y: 250, width: 100, height: 30))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func onButtonTap() {
        piechart.update(sectors: [WRDrawableSector(percent: 0.20, backgroundColor: UIColor.red, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.10, backgroundColor: UIColor.orange, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.08, backgroundColor: UIColor.yellow, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.21, backgroundColor: UIColor.green, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.06, backgroundColor: UIColor.cyan, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.18, backgroundColor: UIColor.blue, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14)),
                                  WRDrawableSector(percent: 0.12, backgroundColor: UIColor.purple, foregroundColor: UIColor.black, font: UIFont.systemFont(ofSize: 14))])
    }
}

