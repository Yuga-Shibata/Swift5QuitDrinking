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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let backVC = segue.destination as! QuitViewController
//            backVC.back = true
//            print("成功")
//        }
        // Do any additional setup after loading the view.
    }

    @IBAction func home(_ sender: Any) {
        // 2つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)

    }
    
    
}
