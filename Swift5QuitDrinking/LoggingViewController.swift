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
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var message2: UILabel!
    @IBOutlet weak var message3: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var logCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(logCount)
        responsive()
        insertText()
    }

    @IBAction func home(_ sender: Any) {
        // 2つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    func insertText(){
        message2.numberOfLines = 2
        message2.text = "　千里の道も一歩から。\nこの調子で習慣を継続していきましょう！"
        
        message3.numberOfLines = 5
        message3.text = "過剰なアルコールの摂取\nは、消化器官、循環器系、\n脳、抹消神経などの\n臓器へと影響を及ぼす\nことがあります。"
    }
    
    
    // レスポンシブ化
    func responsive(){
        // iPadだったら
        if view.frame.maxX >= 768{
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.72, width: 200, height: 200)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.5, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.35, width: view.frame.maxX - 10, height: 200)
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
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.45, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.3, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.2, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
        } else if view.frame.maxY == 736 {
            // iPhone8Plusの場合
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.68, width: 150, height: 150)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.45, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.275, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.15, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
            
        } else if view.frame.maxY == 667 {
            // iPhone8 OR iPhonwSE
            // backButton
            backButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.7, width: 150, height: 150)
            // message3
            message3.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.425, width: view.frame.maxX - 10, height: 200)
            // message2
            message2.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.25, width: view.frame.maxX - 10, height: 200)
            // message
            message.frame = CGRect(x: view.frame.maxX / 2 - (view.frame.maxX - 10)/2, y: view.frame.maxY * 0.15, width: view.frame.maxX - 10, height: 200)
            // countLabel
            countLabel.frame = CGRect(x: view.frame.maxX / 2 + 40, y: view.frame.maxY * 0.175, width: 70, height: 40)
            // quitCount
            quitCount.frame = CGRect(x: view.frame.maxX / 2 - 80, y: view.frame.maxY * 0.175, width: 70, height: 40)
        }
        // iPhone11、ProMax用(何も記述しない)
    }
    
    
    
}
