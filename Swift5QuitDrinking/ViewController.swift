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
    
    var animationView:AnimationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // animationを実行
//        animation()
    }
    // 他のビューから戻ってきたときにも処理を行う
    override func viewWillAppear(_ animated: Bool) {
        animation()
    }
    
    @IBAction func start(_ sender: Any) {
        // 画面遷移をする
//        seni()
        
    }
    
    @IBAction func log(_ sender: Any) {
        
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
}

