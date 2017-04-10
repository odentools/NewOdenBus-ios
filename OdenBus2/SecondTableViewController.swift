//
//  SecondTableViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/04/03.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SecondTableViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    //受け取るための空は配列
    var Allarray2:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Allarray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell2", for: indexPath as IndexPath)
        
        cell.textLabel!.text = Allarray2[indexPath.row]
        //セルのテキストのフォントサイズを変更
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セル番号：(indexPath.row) セルの内容：(fruits[indexPath.row])")
    }
    
}
