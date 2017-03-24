//
//  SecondViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/01/30.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var jikoku:String = ""
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


        //現在時刻を表示
        updateDateLabel()
        
        // timerLabel2に一定間隔で実行
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.updateDateLabel), userInfo: nil, repeats: true)
        
        BusJikoku.text = jikoku

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // 日時表示ラベル更新メソッド
    //timerLabelに時刻を表示
    func updateDateLabel(){
        let now = NSDate()
        timerLabel.text = dateFormatter.string(from: now as Date)
    }

    @IBOutlet weak var BusJikoku: UILabel!
    
    @IBAction func NamiHayaTel(_ sender: Any) {
       // UIApplication.shared.openURL(NSURL(string: "tel://0728790304")! as URL)
        self.present(alert, animated: true, completion:nil)

    }
    
}
