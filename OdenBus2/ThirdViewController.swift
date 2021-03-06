//
//  ThirdViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/01.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ThirdViewController: UIViewController, GADBannerViewDelegate {
    
    //広告表示のためのview
    @IBOutlet weak var bannerView2: GADBannerView!
    
    let request = GADRequest()
    
    
    var ukewatasu2:String = ""
    @IBAction func back3(segue:UIStoryboardSegue){//戻るボタン用
        animateImage(target: imageview3)
        animateImage(target: imageview4)
    }
    
    //全時刻を渡すための空配列
    var jikokuUkewatasu2:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        animateImage(target: imageview3)
        animateImage(target: imageview4)
        
        request.testDevices = [kGADSimulatorID]
        bannerView2.delegate = self
        bannerView2.adUnitID = "ca-app-pub-2908759432198947/9315278516"
        bannerView2.rootViewController = self
        bannerView2.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goJikoku2") {
            let jvc: FourthViewController = (segue.destination as? FourthViewController)!
            
            if ukewatasu2 == resultHoliday1() {
                ukewatasu2 = resultHoliday1()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 0
            } else if ukewatasu2 == resultHoliday2() {
                ukewatasu2 = resultHoliday2()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 1
            } else if ukewatasu2 == resultHoliday3() {
                ukewatasu2 = resultHoliday3()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 2
            } else if ukewatasu2 == resultHoliday4() {
                ukewatasu2 = resultHoliday4()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 3
            } else if ukewatasu2 == resultHoliday5() {
                ukewatasu2 = resultHoliday5()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 4
            } else if ukewatasu2 == resultHoliday6() {
                ukewatasu2 = resultHoliday6()
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 5
            } else if ukewatasu2 == resultHoliday7() {
                jvc.jikoku2 = ukewatasu2
                jvc.jikokuArray2 = jikokuUkewatasu2
                jvc.number2 = 8
            }
            //jvc.jikoku = ukewatasu //jikokuViewcontrollerの中のstring変数に渡す
        }
    }
    
    @IBAction func HolidaySbSijyou(_ sender: Any) {
        ukewatasu2 = resultHoliday1()
        
        jikokuUkewatasu2 = ["AM:8:24:00","AM:8:39:00","AM:9:07:00","AM:9:37:00","AM:10:07:00","AM:10:37:00","AM:11:07:00","PM:11:37:00","PM:12:07:00","PM:12:37:00","PM:13:07:00","PM:13:37:00","PM:14:07:00","PM:14:37:00","AM:15:07:00","AM:15:37:00","AM:16:07:00","AM:16:37:00","PM:17:07:00","PM:17:37:00","PM:18:07:00","PM:18:37:00","PM:19:07:00","PM:19:37:00"]
        
    }

    @IBAction func HolidaySbNeyagawa(_ sender: Any) {
        ukewatasu2 = resultHoliday2()
        
        jikokuUkewatasu2 = ["AM:9:17:00","AM:9:47:00","AM:10:17:00","AM:10:47:00","AM:11:17:00","AM:11:47:00","PM:12:17:00","PM:12:47:00","PM:13:17:00","PM:13:47:00","PM:14:17:00","PM:14:47:00","PM:15:17:00","PM:15:47:00","PM:16:17:00","PM:16:47:00","PM:17:17:00","PM:17:47:00","PM:18:17:00","PM:18:47:00","PM:19:17:00","PM:19:47:00","PM:20:19:00"]
    }
    
    @IBAction func HolidayKintetuSijyouDentu(_ sender: Any) {
        ukewatasu2 = resultHoliday3()
        
        jikokuUkewatasu2 = ["AM:8:00:00","AM:8:38:00","AM:9:01:00","AM:9:31:00","AM:9:48:00","AM:10:13:00","AM:10:38:00","AM:10:50:00","AM:11:28:00","AM:11:45:00","PM:12:10:00","PM:12:55:00","PM:13:11:00","PM:13:45:00","PM:14:10:00","PM:14:40:00","PM:15:10:00","PM:15:44:00","PM:15:55:00","PM:16:10:00","PM:16:39:00","PM:17:09:00","PM:17:24:00","PM:18:28:00"]
    }
    
    @IBAction func HolidayKintetuSijyou(_ sender: Any) {
        ukewatasu2 = resultHoliday4()
        
        jikokuUkewatasu2 = ["AM:8:22:00","AM:9:11:00","AM:9:47:00","AM:10:18:00","AM:10:32:00","AM:11:10:00","AM:11:50:00","PM:12:33:00","PM:12:53:00","PM:13:15:00","PM:13:27:00","PM:13:48:00","PM:14:06:00","PM:14:48:00","PM:15:15:00","PM:15:33:00","PM:15:51:00","PM:16:18:00","PM:16:34:00","PM:17:03:00","PM:17:34:00","PM:17:44:00","PM:18:52:00"]
    }
    
    @IBAction func HolidayKintetuKiyotaki(_ sender: Any) {
        ukewatasu2 = resultHoliday5()
        jikokuUkewatasu2 = ["AM:6:58:00","AM:7:29:00","AM:7:43:00","AM:8:25:00","PM:17:55:00","PM:18:13:00","PM:18:54:00","PM:19:10:00","PM:19:55:00","PM:20:25:00","PM:20:55:00","PM:21:30:00"]
    }
    
    @IBAction func HolidayKintetuKiyotakiHatu(_ sender: Any) {
        ukewatasu2 = resultHoliday6()
        
        jikokuUkewatasu2 = ["AM:6:38:00","AM:7:25:00","AM:7:44:00","AM:8:08:00","AM:8:24:00","AM:8:40:00","AM:9:13:00","AM:9:49:00","AM:10:20:00","AM:10:34:00","AM:11:12:00","AM:11:52:00","PM:12:35:00","PM:12:55:00","PM:13:17:00","PM:13:29:00","PM:13:50:00","PM:14:08:00","PM:14:50:00","PM:15:17:00","PM:15:35:00","PM:15:53:00","PM:16:20:00","PM:16:36:00","PM:17:05:00","PM:17:36:00","PM:17:46:00","PM:18:11:00","PM:18:54:00","PM:19:40:00","PM:20:10:00","PM:20:40:00","PM:21:14:00"]
    }
    
    @IBAction func Holiday2(_ sender: Any) {
        ukewatasu2 = resultHoliday7()
        
        jikokuUkewatasu2 = ["AM:8:34:00","AM:9:02:00","AM:9:32:00","AM:10:02:00","AM:10:32:00","AM:11:02:00","AM:11:32:00","PM:12:02:00","PM:12:32:00","PM:13:02:00","PM:13:32:00","PM:14:02:00","PM:14:32:00","PM:15:02:00","PM:15:32:00","PM:16:02:00","PM:16:32:00","PM:17:02:00","PM:17:32:00","PM:18:02:00","PM:18:32:00","PM:19:02:00","PM:19:32:00"]
    }
    
    //寝屋川C-四條畷C
    func resultHoliday1() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:24:00"),("Next Bus  AM","8:39:00"),("Next Bus  AM","9:07:00"),("Next Bus AM","9:37:00"),("Next Bus  AM","10:07:00"),("Next Bus  AM","10:37:00"),("Next Bus  AM","11:07:00"),("Next Bus  AM","11:37:00"),("Next Bus  PM","12:07:00"),("Next Bus  PM","12:47:00"),("Next Bus  PM","13:07:00"),("Next Bus  PM","13:37:00"),("Next Bus  PM","14:07:00"),("Next Bus  PM","14:37:00"),("Next Bus  PM","15:07:00"),("Next Bus  PM","15:37:00"),("Next Bus PM","16:07:00"),("Next Bus  PM","16:37:00"),("Next Bus  PM","17:07:00"),("Next Bus  PM","17:37:00"),("Next Bus  PM","18:07:00"),("Next Bus PM","18:37:00"),("Next Bus  PM","19:07:00"),("Next Bus  PM","19:37:00")]
        
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
    
    //四條畷-寝屋川市駅行き
    func resultHoliday2() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","9:17:00"),("Next Bus  AM","9:47:00"),("Next Bus  AM","10:17:00"),("Next Bus  AM","10:47:00"),("Next Bus  AM","11:17:00"),("Next Bus  AM","11:47:00"),("Next Bus  PM","12:17:00"),("Next Bus  PM","12:47:00"),("Next Bus  PM","13:17:00"),("Next Bus  PM","13:47:00"),("Next Bus  PM","14:17:00"),("Next Bus  PM","14:47:00"),("Next Bus  PM","15:17:00"),("Next Bus  PM","15:47:00"),("Next Bus  PM","16:17:00"),("Next Bus  PM","16:47:00"),("Next Bus  PM","17:17:00"),("Next Bus  PM","17:47:00"),("Next Bus  PM","18:17:00"),("Next Bus  PM","18:47:00"),("Next Bus  PM","19:17:00"),("Next Bus  PM","19:47:00"),("Next Bus  PM","20:19:00")]
        
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
    
    //近鉄バス四條畷電通大行き
    func resultHoliday3() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:00:00"),("Next Bus  AM","8:38:00"),("Next Bus AM","9:01:00"),("Next Bus  AM","9:31:00"),("Next Bus  AM","9:48:00"),("Next Bus  AM","10:13:00"),("Next Bus  AM","10:38:00"),("Next Bus AM","10:50:00"),("Next Bus  AM","11:28:00"),("Next Bus  AM","11:45:00"),("Next Bus  PM","12:10:00"),("Next Bus  PM","12:55:00"),("Next Bus  PM","13:11:00"),("Next Bus  PM","13:45:00"),("Next Bus  PM","14:10:00"),("Next Bus  PM","14:40:00"),("Next Bus  PM","15:10:00"),("Next Bus  PM","15:44:00"),("Next Bus  PM","15:55:00"),("Next Bus  PM","16:10:00"),("Next Bus  PM","16:39:00"),("Next Bus  PM","17:09:00"),("Next Bus  PM","17:24:00"),("Next Bus  PM","18:28:00")]
        
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
    
    //近鉄バス四條畷行き
    func resultHoliday4() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:22:00"),("Next Bus  AM","9:11:00"),("Next Bus  AM","9:47:00"),("Next Bus  AM","10:18:00"),("Next Bus  AM","10:32:00"),("Next Bus  AM","11:10:00"),("Next Bus  AM","11:50:00"),("Next Bus  PM","12:33:00"),("Next Bus  PM","12:53:00"),("Next Bus  PM","13:15:00"),("Next Bus  PM","13:27:00"),("Next Bus  PM","13:48:00"),("Next Bus  PM","14:06:00"),("Next Bus  PM","14:48:00"),("Next Bus  PM","15:15:00"),("Next Bus  PM","15:33:00"),("Next Bus  PM","15:51:00"),("Next Bus  PM","16:18:00"),("Next Bus  PM","16:34:00"),("Next Bus  PM","17:03:00"),("Next Bus  PM","17:34:00"),("Next Bus  PM","17:44:00"),("Next Bus  PM","18:52:00")]
        
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

    func resultHoliday5() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","6:58:00"),("Next Bus  AM","7:29:00"),("Next Bus  AM","7:43:00"),("Next Bus  AM","8:25:00"),("Next Bus  PM","17:55:00"),("Next Bus  PM","18:13:00"),("Next Bus  PM","18:54:00"),("Next Bus  PM","19:10:00"),("Next Bus  PM","19:55:00"),("Next Bus  PM","20:25:00"),("Next Bus  PM","20:55:00"),("Next Bus PM","21:30:00")]
        
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
    
    func resultHoliday6() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","6:38:00"),("Next Bus  AM","7:25:00"),("Next Bus  AM","7:44:00"),("Next Bus  AM","8:08:00"),("Next Bus  AM","8:24:00"),("Next Bus  AM","8:40:00"),("Next Bus  AM","9:13:00"),("Next Bus  AM","9:49:00"),("Next Bus  AM","10:20:00"),("Next Bus  AM","10:34:00"),("Next Bus  AM","11:12:00"),("Next Bus  AM","11:52:00"),("Next Bus  PM","12:35:00"),("Next Bus  PM","12:55:00"),("Next Bus  PM","13:17:00"),("Next Bus  PM","13:29:00"),("Next Bus  PM","13:50:00"),("Next Bus  PM","14:08:00"),("Next Bus  PM","14:50:00"),("Next Bus PM","15:17:00"),("Next Bus  PM","15:35:00"),("Next Bus  PM","15:53:00"),("Next Bus  PM","16:20:00"),("Next Bus  PM","16:36:00"),("Next Bus  PM","17:05:00"),("Next Bus  PM","17:36:00"),("Next Bus  PM","17:46:00"),("Next Bus  PM","18:11:00"),("Next Bus  PM","18:54:00"),("Next Bus  PM","19:40:00"),("Next Bus  PM","20:10:00"),("Next Bus  PM","20:40:00"),("Next Bus  PM","21:14:00")]
        
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
    
    
    func resultHoliday7() -> String {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let nowString = timeFormatter.string(from: NSDate() as Date)
        let nowTime = timeFormatter.date(from: nowString)!
        
        let jikokuArray: [(String, String)] = [("Next Bus  AM","8:34:00"),("Next Bus  AM","9:02:00"),("Next Bus  AM","9:32:00"),("Next Bus AM","10:02:00"),("Next Bus  AM","10:32:00"),("Next Bus  AM","11:02:00"),("Next Bus  AM","11:32:00"),("Next Bus  PM","12:02:00"),("Next Bus  PM","12:32:00"),("Next Bus  PM","13:02:00"),("Next Bus  PM","13:42:00"),("Next Bus  PM","14:02:00"),("Next Bus  PM","14:32:00"),("Next Bus  PM","15:02:00"),("Next Bus  PM","15:32:00"),("Next Bus  PM","16:02:00"),("Next Bus PM","16:32:00"),("Next Bus  PM","17:02:00"),("Next Bus  PM","17:32:00"),("Next Bus  PM","18:02:00"),("Next Bus  PM","18:32:00"),("Next Bus PM","19:02:00"),("Next Bus  PM","19:32:00")]
        
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

    @IBOutlet weak var imageview3: UIImageView!

    @IBOutlet weak var imageview4: UIImageView!
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
