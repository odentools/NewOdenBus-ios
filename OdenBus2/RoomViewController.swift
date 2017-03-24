//
//  RoomViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/14.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var cellNumber:Int = 0
    
    var roomImageView = UIImageView()
    var roomNameLabel = UILabel()
    
    var roomName = String()
    
    var roomImageArray = ["taxi1.png","taxi1.png","taxi1.png","taxi1.png","taxi1.png","taxi1.png","taxi1.png",] //roomImageArray配列に画像を格納
    
    var roomNameArray = ["電通大までご一緒に！","四條畷までご一緒に！","清滝団地までご一緒に！","寝屋川までご一緒に！","乗り合いの集い１","乗り合いの集い２","乗り合いの集い３"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return roomNameArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //1番目のセルのidentifierをCellに設定し、それをlet cellに格納
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none //ハイライト無効化
        
        roomImageView = cell.viewWithTag(1) as! UIImageView //1つ目のセルのUIImageviewとの紐付け tagはimageviewのインスペクタで設定
        roomNameLabel = cell.viewWithTag(2) as! UILabel
        
        
        roomImageView.image = UIImage(named: roomImageArray[indexPath.row])
        roomNameLabel.text = roomNameArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cellNumber = indexPath.row
        
        roomName = roomNameArray[indexPath.row]
        
        //pushで画面遷移
        
        performSegue(withIdentifier: "talk", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "talk"){ //タップされたidentifierがchatだったら
            
            //ChatViewControllerを初期化して、定数chatVCに置き換える
            let talkVC:TalkViewController = segue.destination as! TalkViewController
            
            talkVC.cellNumber = cellNumber
            talkVC.roomName = roomName
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
