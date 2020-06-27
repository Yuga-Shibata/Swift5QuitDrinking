//
//  ViewController.swift
//  Swift5QuitDrinking
//
//  Created by 柴田優河 on 2020/06/05.
//  Copyright © 2020 Makoto Shibata. All rights reserved.
//

import UIKit
import Lottie
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var lastQuitDay: UILabel!
    @IBOutlet weak var totalQuitCount: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var quitLabel: UILabel!

    
    var userDefaults = UserDefaults.standard
    var animationView:AnimationView = AnimationView()
    var HomeCount = Int()
    var audioPlayer: AVAudioPlayer!
    
    
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
        responsive()
        dayLabel.textColor = .black
        countLabel.textColor = .black
        playMusic()
    }
    
    @IBAction func start(_ sender: Any) {
        // 画面遷移をする
//        seni()
        audioPlayer.play()
        
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
    
    // レスポンシブ化
    func responsive(){
        // iPadだったら
        if view.frame.maxX >= 768{
        // startButtonのレイアウトを指定
        startButton.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.72, width: 200, height: 200)
            // quitLabelのレイアウトを設定
            quitLabel.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.85, width: 200, height: 200)
        // totalQuitCountのレイアウトを設定
            totalQuitCount.frame = CGRect(x: view.frame.maxX / 4 , y: view.frame.maxY * 0.68, width: 156, height: 30)
        // lastQuitDayのレイアウトを設定
            lastQuitDay.frame = CGRect(x: view.frame.maxX / 4, y: view.frame.maxY * 0.64, width: 156, height: 30)
        // countLabelのレイアウト設定
            countLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.68, width: 156, height: 30)
        // dayLabelのレイアウト設定
            dayLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.64, width: 156, height: 30)
            
        } else if view.frame.maxY == 812 {
            // iPhone11Proだった場合
            // startButtonのレイアウトを指定
            startButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.73, width: 150, height: 150)
            // quitLabelのレイアウトを設定
            quitLabel.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.82, width: 200, height: 200)
            // totalQuitCountのレイアウトを設定
                totalQuitCount.frame = CGRect(x: 10 , y: view.frame.maxY * 0.68, width: 156, height: 30)
            // lastQuitDayのレイアウトを設定
                lastQuitDay.frame = CGRect(x: 10, y: view.frame.maxY * 0.62, width: 156, height: 30)
            // countLabelのレイアウト設定
                countLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.68, width: 156, height: 30)
            // dayLabelのレイアウト設定
                dayLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.62, width: 156, height: 30)
        } else if view.frame.maxY == 736 {
            // iPhone8Plusの場合
            // startButtonのレイアウトを指定
            startButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.73, width: 140, height: 140)
            // quitLabelのレイアウトを設定
            quitLabel.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.82, width: 200, height: 200)
            // totalQuitCountのレイアウトを設定
                totalQuitCount.frame = CGRect(x: 10 , y: view.frame.maxY * 0.68, width: 156, height: 30)
            // lastQuitDayのレイアウトを設定
                lastQuitDay.frame = CGRect(x: 10, y: view.frame.maxY * 0.63, width: 156, height: 30)
            // countLabelのレイアウト設定
                countLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.68, width: 156, height: 30)
            // dayLabelのレイアウト設定
                dayLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.63, width: 156, height: 30)
        } else if view.frame.maxY == 667 {
            // iPhone8 OR iPhonwSE
            // startButtonのレイアウトを指定
            startButton.frame = CGRect(x: view.frame.maxX / 2 - 150 / 2, y: view.frame.maxY * 0.73, width: 140, height: 140)
            // quitLabelのレイアウトを設定
            quitLabel.frame = CGRect(x: view.frame.maxX / 2 - 100, y: view.frame.maxY * 0.82, width: 200, height: 200)
            // totalQuitCountのレイアウトを設定
                totalQuitCount.frame = CGRect(x: 10 , y: view.frame.maxY * 0.68, width: 156, height: 30)
            // lastQuitDayのレイアウトを設定
                lastQuitDay.frame = CGRect(x: 10, y: view.frame.maxY * 0.63, width: 156, height: 30)
            // countLabelのレイアウト設定
                countLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.68, width: 156, height: 30)
            // dayLabelのレイアウト設定
                dayLabel.frame = CGRect(x: view.frame.maxX / 2, y: view.frame.maxY * 0.63, width: 156, height: 30)
        }
        // iPhone11、ProMax用(何も記述しない)
    }
    
    // 音楽再生
    func playMusic(){
        // 再生するaudioファイルのパスを取得
            let audioPath = Bundle.main.path(forResource: "touch", ofType: "mp3")!
            let audioUrl = URL(fileURLWithPath: audioPath)
            
            
            // audioを再生するplayerを作成する
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
                // backgroundで再生する
                try AVAudioSession.sharedInstance().setCategory(
                .playback, mode: .default)
            } catch let error as NSError {
                print(error)
                audioPlayer = nil
            }
        
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
    }


}
