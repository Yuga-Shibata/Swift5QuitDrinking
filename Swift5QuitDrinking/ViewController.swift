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
    @IBAction func start(_ sender: Any) {
        // 画面遷移をする
        //performSegue(withIdentifier: "next", sender: nil)
        let nextVC = storyboard?.instantiateViewController(identifier: "quit") as! QuitViewController
        navigationController?
            .pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func log(_ sender: Any) {
    }
    

    func animation(){
        let animation = Animation.named("beer")
        animationView.frame = CGRect(x: 0, y: (view.frame.size.height / 5) * -1, width: view.frame.size.width, height: view.frame.size.height)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        // 一度だけ、アニメーションを実行
        animationView.loopMode = .autoReverse
        animationView.backgroundColor = .clear
        view.addSubview(animationView)
        animationView.play()
    }
}

