//
//  LoggingViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit

class LoggingViewController: UIViewController {
    
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var logCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let backVC = segue.destination as! QuitViewController
//            backVC.back = true
//            print("成功")
//        }
        // Do any additional setup after loading the view.
        countLabel.text = String(logCount)
    }

    @IBAction func home(_ sender: Any) {
        // 2つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    
}
