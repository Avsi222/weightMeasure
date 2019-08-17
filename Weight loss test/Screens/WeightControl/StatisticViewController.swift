//
//  StatisticViewController.swift
//  Weight loss test
//
//  Created by Арсений Дорогин on 17/08/2019.
//  Copyright © 2019 Ramazan. All rights reserved.
//

import UIKit
import Charts

class StatisticViewController: UIViewController {

    @IBOutlet weak var barChart:BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartUpdate()
    }
    
    func barChartUpdate () {
        
        // Basic set up of plan chart
        
        var decodedArray = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: "weight") as! Data) as! [Int]
        
        let weights = decodedArray
        var entry = [ChartDataEntry]()
        var index = 0
        for number in weights{
            entry.append(BarChartDataEntry(x: Double(index), y: Double(number)))
            index+=1
        }
        let dataSet = BarChartDataSet(entries: entry, label: "")
        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
        barChart.chartDescription?.text = "Статистика изменений веса"
        
        // Color
        dataSet.colors = ChartColorTemplates.vordiplom()
        
        // Refresh chart with new data
        barChart.notifyDataSetChanged()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
