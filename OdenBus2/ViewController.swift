//
//  ViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/01/30.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
    
    //広告表示のためのview
    @IBOutlet weak var bannerView: GADBannerView!
    
    let request = GADRequest()
    
    //SecondViewControllerの戻った時の処理
    @IBAction func back(segue:UIStoryboardSegue){//戻るボタン用
        
        animateImage(target: imageview)
        animateImage(target: imageview2)
    }
    
    //ThirdViewControllerの戻った時の処理
    @IBAction func back2(segue:UIStoryboardSegue){//戻るボタン用
        
        animateImage(target: imageview)
        animateImage(target: imageview2)
    }
    
    //FourthViewControllerの戻った時の処理
    @IBAction func back3(segue:UIStoryboardSegue){//戻るボタン用
        
        animateImage(target: imageview)
        animateImage(target: imageview2)
    }
    
    @IBAction func back4(segue:UIStoryboardSegue){
        animateImage(target: imageview)
        animateImage(target: imageview2)
    }
    
    @IBAction func back5(segue:UIStoryboardSegue){//戻るボタン用
    }

    var ukewatasu:String = ""
    
    //全時刻表を渡すための空配列
    var jikokuUkewatasu:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        animateImage(target: imageview)
        animateImage(target: imageview2)
        
        request.testDevices = [kGADSimulatorID]
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-2908759432198947/9315278516"
        bannerView.rootViewController = self
        bannerView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goJikoku") {
            let jvc: SecondViewController = (segue.destination as? SecondViewController)!
            //ここにバスによって違う時刻の配列を渡す
            if ukewatasu == result1() {
                ukewatasu = result1()
                jvc.jikoku = ukewatasu
                jvc.jikokuArray = jikokuUkewatasu
                jvc.number = 0
            } else if ukewatasu == result2() {
                ukewatasu = result2()
                jvc.jikoku = ukewatasu
                jvc.jikokuArray = jikokuUkewatasu
                jvc.number = 1
            } else if ukewatasu == result3() {
                ukewatasu = result3()
                jvc.jikoku = ukewatasu
                jvc.jikokuArray = jikokuUkewatasu
                jvc.number = 2
            } else if ukewatasu == result4() {
                ukewatasu = result4()
                jvc.jikoku = ukewatasu
                jvc.jikokuArray = jikokuUkewatasu
                jvc.number = 4
            } else if ukewatasu == result5() {
                ukewatasu = result5()
                jvc.jikoku = ukewatasu
                jvc.jikokuArray = jikokuUkewatasu
                jvc.number = 5
            } else if ukewatasu == result6() {
                ukewatasu = result6()
                jvc.jikoku = ukewatasu
            }
            //jvc.jikoku = ukewatasu //jikokuViewcontrollerの中のstring変数に渡す
        }
    }

    @IBAction func SbSIjyou(_ sender: Any) {
        ukewatasu = result1()
        //全時刻Table用
        jikokuUkewatasu = ["AM:9:10:00","AM:9:50:00","AM:10:10:00","AM:10:50:00","AM:11:10:00","AM:11:30:00","AM:11:50:00","PM:12:10:00","PM:12:50:00","PM:13:10:00","PM:14:10:00","PM:15:10:00","PM:15:20:00","PM:15:50:00","PM:16:05:00","PM:16:42:00","PM:16:50:00","PM:16:55:00","PM:17:00:00","PM:17:05:00","PM:17:50:00","PM:18:05:00","PM:18:35:00","PM:18:50:00","PM:19:05:00","PM:19:35:00","PM:19:50:00","PM:20:05:00","PM:20:35:00","PM:21:05:00"]
    
    }

    @IBAction func SbNeyagawa(_ sender: Any) {
        
        ukewatasu = result2()
        //全時刻のTable用
        jikokuUkewatasu = ["AM:8:30:00","AM:8:40:00","AM:9:00:00","AM:9:05:00","AM:9:40:00","AM:10:20:00","AM:10:40:00","AM:11:20:00","AM:11:40:00","AM:12:20:00","AM:12:40:00","AM:13:00:00","AM:13:20:00","AM:13:40:00","AM:14:20:00","AM:14:40:00","AM:15:20:00","AM:15:40:00","AM:16:20:00","AM:16:40:00","AM:17:20:00","AM:17:40:00","AM:18:20:00","AM:18:40:00","AM:19:05:00","AM:19:40:00","AM:20:05:00","AM:20:40:00"]
    }
    
    @IBAction func KintetuDentu(_ sender: Any) {
        ukewatasu = result3()
    }
    
    @IBAction func KintetuSijyou(_ sender: Any) {
        ukewatasu = result4()
    }
    
    @IBAction func KintetuKiyotaki(_ sender: Any) {
        ukewatasu = result5()
    }
    
    @IBAction func KintetuKiyotakiHatu(_ sender: Any) {
        ukewatasu = result6()
    }
    
    
    //スクールバス四条畷
    // MARK: 現在時刻から一番近い値を算出する関数
    func result1() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","9:10:00"),("Next Bus  AM","9:50:00"),("Next Bus  AM","10:10:00"),("Next Bus  AM","10:50:00"),("Next Bus  AM","11:10:00"),("Next Bus  AM","11:30:00"),("Next Bus  AM","11:50:00"),("Next Bus  PM","12:10:00"),("Next Bus  PM","12:50:00"),("Next Bus  PM","13:10:00"),("Next Bus  PM","14:10:00"),("Next Bus  PM","15:10:00"),("Next Bus  PM","15:20:00"),("Next Bus  PM","15:50:00"),("Next Bus  PM","16:05:00"),("Next Bus  PM","16:42:00"),("Next Bus  PM","16:50:00"),("Next Bus  PM","16:55:00"),("Next Bus  PM","17:00:00"),("Next Bus  PM","17:05:00"),("Next Bus  PM","17:50:00"),("Next Bus  PM","18:05:00"),("Next Bus  PM","18:35:00"),("Next Bus  PM","18:50:00"),("Next Bus  PM","19:05:00"),("Next Bus  PM","19:35:00"),("Next Bus  PM","19:50:00"),("Next Bus  PM","20:05:00"),("Next Bus  PM","20:35:00"),("Next Bus  PM","21:05:00")]
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    //スクールバス寝屋川
    func result2() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:30:00"),("Next Bus  AM","8:40:00"),("Next Bus  AM","9:00:00"),("Next Bus  AM","9:05:00"),("Next Bus  AM","9:40:00"),("Next Bus  AM","10:20:00"),("Next Bus  AM","10:40:00"),("Next Bus  PM","11:20:00"),("Next Bus  PM","11:40:00"),("Next Bus  PM","12:20:00"),("Next Bus  PM","12:40:00"),("Next Bus  PM","13:00:00"),("Next Bus  PM","13:20:00"),("Next Bus  PM","13:40:00"),("Next Bus  PM","14:20:00"),("Next Bus  PM","14:40:00"),("Next Bus  PM","15:20:00"),("Next Bus  PM","15:40:00"),("Next Bus  PM","16:20:00"),("Next Bus  PM","16:40:00"),("Next Bus  PM","17:20:00"),("Next Bus  PM","17:40:00"),("Next Bus  PM","18:20:00"),("Next Bus  PM","18:40:00"),("Next Bus  PM","19:05:00"),("Next Bus  PM","19:40:00"),("Next Bus  PM","20:05:00"),("Next Bus  PM","20:40:00")]
        
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    
    func result3() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:03:00"),("Next Bus  AM","8:13:00"),("Next Bus  AM","8:24:00"),("Next Bus  AM","8:31:00"),("Next Bus  AM","8:41:00"),("Next Bus  AM","8:58:00"),("Next Bus  AM","9:05:00"),("Next Bus  AM","9:17:00"),("Next Bus  AM","9:23:00"),("Next Bus  AM","9:30:00"),("Next Bus  AM","9:51:00"),("Next Bus  AM","10:04:00"),("Next Bus  AM","10:24:00"),("Next Bus  AM","10:33:00"),("Next Bus  AM","10:40:00"),("Next Bus  AM","11:10:00"),("Next Bus AM","11:40:00"),("Next Bus  PM","13:10:00"),("Next Bus  PM","13:44:00"),("Next Bus  PM","12:08:00"),("Next Bus  PM","12:30:00"),("Next Bus  PM","12:42:00"),("Next Bus  PM","14:03:00"),("Next Bus  PM","14:25:00"),("Next Bus  PM","15:05:00"),("Next Bus  PM","15:26:00"),("Next Bus  PM","15:40:00"),("Next Bus  PM","16:09:00"),("Next Bus  PM","16:29:00"),("Next Bus  PM","16:47:00"),("Next Bus  PM","17:10:00"),("Next Bus  PM","17:42:00"),("Next Bus  PM","17:55:00"),("Next Bus  PM","18:29:00")]
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    
    func result4() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:23:00"),("Next Bus  AM","8:40:00"),("Next Bus  AM","8:47:00"),("Next Bus  AM","8:57:00"),("Next Bus  AM","9:14:00"),("Next Bus  AM","9:33:00"),("Next Bus  AM","9:46:00"),("Next Bus  AM","10:05:00"),("Next Bus  AM","10:22:00"),("Next Bus  AM","10:52:00"),("Next Bus  AM","11:20:00"),("Next Bus  AM","11:40:00"),("Next Bus  AM","11:50:00"),("Next Bus  PM","12:10:00"),("Next Bus  PM","12:37:00"),("Next Bus  PM","13:04:00"),("Next Bus  PM","13:44:00"),("Next Bus  PM","14:20:00"),("Next Bus  PM","14:45:00"),("Next Bus  PM","15:10:00"),("Next Bus  PM","15:20:00"),("Next Bus  PM","15:24:00"),("Next Bus  PM","15:49:00"),("Next Bus  PM","16:10:00"),("Next Bus  PM","16:30:00"),("Next Bus  PM","16:50:00"),("Next Bus  PM","17:07:00"),("Next Bus  PM","17:11:00"),("Next Bus  PM","17:35:00"),("Next Bus  PM","18:00:00"),("Next Bus  PM","18:37:00"),("Next Bus  PM","18:49:00"),("Next Bus  PM","19:54:00")]
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    
    func result5() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        let jikokuArray: [(String, String)] = [("Next Bus  AM","6:19:00"),("Next Bus  AM","6:34:00"),("Next Bus  AM","6:52:00"),("Next Bus  AM","7:07:00"),("Next Bus  AM","7:27:00"),("Next Bus  AM","7:40:00"),("Next Bus  AM","7:53:00"),("Next Bus  PM","12:00:00"),("Next Bus  PM","13:27:00"),("Next Bus  PM","14:50:00"),("Next Bus  PM","15:55:00"),("Next Bus  PM","17:25:00"),("Next Bus  PM","18:10:00"),("Next Bus  PM","18:41:00"),("Next Bus  PM","18:55:00"),("Next Bus  PM","19:18:00"),("Next Bus  PM","19:25:00"),("Next Bus  PM","19:48:00"),("Next Bus  PM","20:12:00"),("Next Bus  PM","20:25:00"),("Next Bus  PM","20:55:00"),("Next Bus  PM","21:24:00"),("Next Bus  PM","21:55:00")]
        
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    
    func result6() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        let jikokuArray: [(String, String)] = [("Next Bus  AM","6:19:00"),("Next Bus  AM","6:36:00"),("Next Bus  AM","6:51:00"),("Next Bus  AM","7:08:00"),("Next Bus  AM","7:24:00"),("Next Bus  AM","7:34:00"),("Next Bus  AM","7:44:00"),("Next Bus  AM","7:56:00"),("Next Bus  AM","8:14:00"),("Next Bus  AM","8:25:00"),("Next Bus  AM","8:42:00"),("Next Bus  AM","8:49:00"),("Next Bus  AM","8:59:00"),("Next Bus  AM","9:35:00"),("Next Bus  AM","9:48:00"),("Next Bus  AM","10:07:00"),("Next Bus  AM","10:24:00"),("Next Bus  AM","10:54:00"),("Next Bus  AM","11:22:00"),("Next Bus  AM","11:42:00"),("Next Bus  AM","11:52:00"),("Next Bus  PM","12:12:00"),("Next Bus  PM","12:39:00"),("Next Bus  PM","13:06:00"),("Next Bus  PM","13:27:00"),("Next Bus  PM","13:46:00"),("Next Bus  PM","14:08:00"),("Next Bus  PM","14:22:00"),("Next Bus  PM","14:47:00"),("Next Bus  PM","15:26:00"),("Next Bus  PM","15:37:00"),("Next Bus  PM","16:12:00"),("Next Bus  PM","16:20:00"),("Next Bus  PM","17:13:00"),("Next Bus  PM","17:37:00"),("Next Bus  PM","17:50:00"),("Next Bus  PM","18:02:00"),("Next Bus  PM","18:25:00"),("Next Bus  PM","18:39:00"),("Next Bus  PM","18:51:00"),("Next Bus  PM","19:10:00"),("Next Bus  PM","19:33:00"),("Next Bus  PM","19:56:00"),("Next Bus  PM","20:08:00"),("Next Bus  PM","20:40:00"),("Next Bus  PM","21:10:00"),("Next Bus  PM","21:37:00")]
        
        
        let resultArray: [(String, String)] = jikokuArray.flatMap({
            let diff = timeFormatter.date(from: $0.1)
            return nowTime.timeIntervalSince(diff ?? nowTime) > 0 ? nil : $0
        })
        
        if resultArray.count > 0, let result = resultArray.first {
            return "\(result.0):\(result.1)"
        } else {
            return "本日のダイヤは終了しました。"
        }
    }
    
    //MARK: タクシーイメージと画像を動かす処理
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var imageview2: UIImageView!
    
    func animateImage(target:UIView){
        // 画面1pt進むのにかかる時間の計算
        let timePerSecond = 20.0 / view.bounds.size.width
        // 画像の位置から画面右までにかかる時間の計算
        let remainTime = (view.bounds.size.width - target.frame.origin.x) * timePerSecond
        // アニメーション
        UIView.transition(with: target, duration: TimeInterval( remainTime), options: .curveLinear, animations: { () -> Void in
            // 画面右まで移動
            target.frame.origin.x = self.view.bounds.width
        }, completion: { _ in
            // 画面右まで行ったら、画面左に戻す
            target.frame.origin.x = -target.bounds.size.width
            // 再度アニメーションを起動
            self.animateImage(target: target)
        })
    }
}

