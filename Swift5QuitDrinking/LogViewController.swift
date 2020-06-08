//
//  LogViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit
import Charts

class LogViewController: UIViewController {

    @IBOutlet weak var BarChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 120]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        BarChartView.data = data
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
