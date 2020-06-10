//
//  QuitViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit
import WCLShineButton

class QuitViewController: UIViewController {
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var beerImage: WCLShineButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var flag = false
    var back = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ボタンのパラメータ
        parameter()
        // messageラベルの文字がはみ出ないように折り返し
        message.lineBreakMode = .byCharWrapping
        
        // nextButtonを押せなくする
        nextButton.isEnabled = false
        // nextButtonを半透明にする
        nextButton.alpha = 0.5
        
    }
    
    @IBAction func tap(_ sender: Any) {
        action()
    }
    
   
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    // ぱらめーた
    func parameter(){
        var param = WCLShineParams()
        let beer = UIImage(named: "beer3")
        param.enableFlashing = true
        param.animDuration = 2
        beerImage.params = param
        beerImage.image = .custom(beer!)
    }
    
    // ビールのアイコンをタップした後の処理
    func action(){
        beerImage.isEnabled = false
        message.font = .boldSystemFont(ofSize: 30)
        message.text = "Good job!"
        message.textColor = .orange
        nextButton.isEnabled = true
        nextButton.alpha = 1.0
    }
    
    
    
}
