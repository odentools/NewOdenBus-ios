//
//  TableViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/03/27.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //受け取る用の空配列
    var Allarray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     //セルの個数を指定する
     func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return Allarray.count
     }
     
     // セルに値を設定するデータソースメソッド（必須）
     //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     // セルを取得する
     let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
     
     // セルに表示する値を設定する
     cell.textLabel!.text = Allarray[indexPath.row]
     //セルの背景色を変更
     //cell.contentView.backgroundColor = UIColor.lightGray
     cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
       
     return cell
     }
     
     /// セルが選択された時に呼ばれるデリゲートメソッド
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     print("セル番号：(indexPath.row) セルの内容：(fruits[indexPath.row])")
     }

    

}
