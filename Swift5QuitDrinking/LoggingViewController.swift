//
//  LoggingViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit

class LoggingViewController: UIViewController {
    
    
    @IBOutlet weak var quitCount: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var message2: UITextView!
    @IBOutlet weak var message3: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    var logCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(logCount)
        responsive()
    }

    @IBAction func home(_ sender: Any) {
        // 2つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    
    
    
    // レスポンシブ化
    func responsive(){
        // iPadだったら
        if view.frame.maxX >= 768{
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.72, width: 200, height: 200)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.4, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.3, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.2, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.15, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.15, width: 70, height: 40)
        } else if view.frame.maxY == 812 {
            // iPhone11Proだった場合
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.72, width: 150, height: 150)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.5, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.375, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.3, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
        } else if view.frame.maxY == 736 {
            // iPhone8Plusの場合
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.68, width: 150, height: 150)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.5, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.375, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.3, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
            
        } else if view.frame.maxY == 667 {
            // iPhone8 OR iPhonwSE
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.68, width: 150, height: 150)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.5, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.375, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.3, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
        }
        // iPhone11、ProMax用(何も記述しない)
    }
    
    
    
}
