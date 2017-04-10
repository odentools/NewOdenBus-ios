//
//  FourthViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/02.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FourthViewController: UIViewController, GADBannerViewDelegate {
    
    //SecondTableView用空配列
    var jikokuArray2:[String] = []
    
    var number2:Int = Int()
    
    //広告を表示させるためにview
    @IBOutlet weak var bannerView4: GADBannerView!
    
    let request = GADRequest()
    
    var jikoku2:String = ""
    var alert:UIAlertController!

    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert = UIAlertController(title: "確認", message: "0728790304に発信", preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(
            title: "発信",
            style: UIAlertActionStyle.default,
            handler: { action in
                
                UIApplication.shared.openURL(NSURL(string: "tel://0728790304")! as URL)
        
        })
        
        let alertAction2 = UIAlertAction(
            title: "キャンセル",
            style: UIAlertActionStyle.cancel,
            handler: nil
        )
        
        alert.addAction(alertAction)
        alert.addAction(alertAction2)

        //現在時刻アップデート
        updateDateLabel()
        
        // timerLabel2に一定間隔で実行
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.updateDateLabel), userInfo: nil, repeats: true)
        
        BusJikokuLabel2.text = jikoku2
        
        request.testDevices = [kGADSimulatorID]
        bannerView4.delegate = self
        bannerView4.adUnitID = "ca-app-pub-2908759432198947/9315278516"
        bannerView4.rootViewController = self
        bannerView4.load(request)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var TimerLabel2: UILabel!

    @IBOutlet weak var BusJikokuLabel2: UILabel!
    
    // 日時表示ラベル更新メソッド
    //timerLabelに時刻を表示
    func updateDateLabel(){
        let now = NSDate()
        TimerLabel2.text = dateFormatter.string(from: now as Date)
    }

    @IBAction func NamihayaTel2(_ sender: Any) {
       // UIApplication.shared.openURL(NSURL(string: "tel://0728790304")! as URL)
        self.present(alert, animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "zen2") {
            let jvc: SecondTableViewController = (segue.destination as? SecondTableViewController)!
            if 0 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 1 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 2 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 3 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 4 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 5 == number2 {
                jvc.Allarray2 = jikokuArray2
            } else if 8 == number2 {
                jvc.Allarray2 = jikokuArray2                
            }
        }
    }
    
    
    @IBAction func zenJikoku2(_ sender: Any) {
        
    }
    
}
