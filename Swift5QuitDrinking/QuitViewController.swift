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
    //  userDefaultsの定義
    var userDefaults = UserDefaults.standard
    var buffer = Int()
    
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
        // データを追加
        var addedData =  addData()
        print("追加後の配列:", addedData)
        print("配列の最後", addedData.last!)
        let text =  addedData.joined()
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
    
    func initList() -> Array<Array<String>>{
        // userDefaultsに格納したい値
        var newData = getDate()
        var data:[[String]] = [[newData]]
        // 配列の保存
        userDefaults.set(data, forKey: "userDate")
        let getMaxSpeed:[[String]] = userDefaults.array(forKey: "userDate") as! [[String]]
        return getMaxSpeed
    }
    
    
    func addData() -> Array<Array<String>>{
        // userDefaultsに保存された値の取得
        var getMaxSpeed:[[String]]! = userDefaults.array(forKey: "userDate") as! [[String]]?
        
        // 一度も実行していない（配列が作成されていなかった）なら
        if getMaxSpeed == nil {
            initList()
            getMaxSpeed = userDefaults.array(forKey: "userDate") as! [[String]]?
            print("initList()を実行♪")
        } else {
            let string = String(describing: getMaxSpeed)
            // 値の追加
            var nowData = getDate()
            var DATA:[[String]] = [[nowData]]
            print(type(of: DATA))
            getMaxSpeed.append(contentsOf: DATA)
            // 追加したデータを保存
            userDefaults.set(getMaxSpeed, forKey: "userDate")
        }
        return getMaxSpeed
    }
    
    
    // 日付を取得する
    func getDate() -> String{
        let dt = Date()
        let dateformatter = DateFormatter()
        // 書式とロケールを設定
        dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd", options: 0, locale: Locale(identifier: "ja_JP"))
        // 文字列型に変換
        let str = dateformatter.string(from: dt)
        return str
    }
    
    
    func initCount() -> Int{
        // UserDefaultsの参照
        let userDefaults = UserDefaults.standard

        // sampleというキーで値「aiueo」を保存する
        userDefaults.set(0, forKey: "Count")
        // UserDefaultsへの値の保存を明示的に行う
        userDefaults.synchronize()

        // Countというキーを指定して保存していたint型の値を取り出す
            var integer: Int! = UserDefaults.standard.integer(forKey: "Count")
        var unWrap = (integer!)

            print("アンラップできてるかな？" ,integer)
        return unWrap
        }
    
    
    
    func addCount() -> Int{
        // userDefaultsに保存された値の取得
        var buffer = UserDefaults.standard.integer(forKey: "Count")
        // 一度も実行していないなら
        if buffer == Optional(0) {
            buffer = initCount()
            buffer += 1
            // 追加したデータを保存
            userDefaults.set(buffer, forKey: "Count")
            print("initCount()を実行♪")
        } else if buffer >= 1 {
            // Countというキーを指定して保存していたint型の値を取り出す
            var integer: Int! = UserDefaults.standard.integer(forKey: "Count")
            var unWrap = integer
            buffer = unWrap!
            buffer += 1
            // 追加したデータを保存
            userDefaults.set(buffer, forKey: "Count")
            }
        return buffer
        }
        

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! LoggingViewController
        let LoaclCount = addCount()
        nextVC.logCount = LoaclCount
        }
    
    
    }

