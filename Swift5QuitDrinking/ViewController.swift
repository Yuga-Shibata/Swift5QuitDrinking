//
//  ViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var userDefaults = UserDefaults.standard
    var animationView:AnimationView = AnimationView()
    var HomeCount = Int()
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animationを実行
//        animation()
       
    }
    // 他のビューから戻ってきたときにも処理を行う
    override func viewWillAppear(_ animated: Bool) {
        animation()
        addCount()
        addData()
    }
    
    @IBAction func start(_ sender: Any) {
        // 画面遷移をする
//        seni()
        
    }

    
    // 画面遷移をする
    func seni(){
        //        performSegue(withIdentifier: "quit", sender: nil)
        let quitVC = storyboard?.instantiateViewController(identifier: "quit") as! QuitViewController
        navigationController?
            .pushViewController(quitVC, animated: true)
    }
    
    // アニメーションを実行
    func animation(){
        let animation = Animation.named("beer")
        animationView.frame = CGRect(x: 0, y: (view.frame.size.height / 14) * 1, width: view.frame.size.width, height: (view.frame.size.height) * 0.6 )
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        // 一度だけ、アニメーションを実行
        animationView.loopMode = .autoReverse
        animationView.backgroundColor = .clear
        view.addSubview(animationView)
        animationView.play()
//        animationView.backgroundColor = .blue
        
//        animationView.sendSubviewToBack(startButton)
        startButton.bringSubviewToFront(animationView)
    }
    
    
    func addCount(){
        // userDefaultsに保存された値の取得
        var buffer = UserDefaults.standard.integer(forKey: "Count")
        // 一度も実行していないなら
        if buffer == Optional(0) {
            countLabel.text = "---"
        } else if buffer >= 1 {
            // Countというキーを指定して保存していたint型の値を取り出す
            var integer: Int! = UserDefaults.standard.integer(forKey: "Count")
            var unWrap = integer
            buffer = unWrap!
            countLabel.text = String(buffer)
            }
        }
    
    
    func addData(){
        // userDefaultsに保存された値の取得
        var getMaxSpeed:[[String]]! = userDefaults.array(forKey: "userDate") as! [[String]]?
        
        // 一度も実行していない（配列が作成されていなかった）なら
        if getMaxSpeed == nil {
            print("initList()を実行♪")
            dayLabel.text = "---"
        } else {
            dayLabel.text = getMaxSpeed.last?.last
        }
    }
    


}
