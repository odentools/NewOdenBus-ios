//
//  ChatSettingViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/14.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class ChatSettingViewController: UIViewController,FBSDKLoginButtonDelegate{

    @IBOutlet var webView: UIWebView!
    
    var name = String()
    var base64String = String()
    var uuid = String()

    override func viewDidLoad() {
        super.viewDidLoad()
                //webviewをスクロールされない
        webView.scrollView.bounces = false
        let gifData = NSData(contentsOfFile: Bundle.main.path(forResource: "cc",ofType: "gif")!)
        webView.load(gifData as! Data,mimeType: "image/gif",textEncodingName: "utf-8",baseURL:NSURL() as URL)
    
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.frame = CGRect(x: self.view.frame.size.width/10, y: self.view.frame.size.height/2, width: self.view.frame.size.width-(self.view.frame.size.width/10 + self.view.frame.size.width/10), height: 50)
        self.view.addSubview(fbLoginButton)
        
        fbLoginButton.delegate = self
        
        if UserDefaults.standard.object(forKey: "OK") != nil {
            
            print("1度ログインしているので、次の画面へ画面遷移します。")
            performSegue(withIdentifier: "talkroom", sender: true)
            
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil{
            
            print("エラーです")
            print(error)
            
        }else if result.isCancelled{
            
        }else{
            
            //取得
            getFacebookUserInfo()
    
        }
        
    }
    
    func getFacebookUserInfo(){
        
        if FBSDKAccessToken.current() != nil {
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,name"]).start{
                (connection,result,error) in
                
                self.name = (result! as AnyObject).value(forKey: "name") as! String
                
                let id = (result! as AnyObject).value(forKey: "id")
                
                let url = URL(string: "https://graph.facebook.com/\(id!)/picture?type=large&return_ssl_resources=1")
                
                let dataURL = NSData(contentsOf:url!)
                
                self.base64String = dataURL!.base64EncodedString(options:NSData.Base64EncodingOptions.lineLength64Characters) as String
                
                //アプリ内に保存する
                UserDefaults.standard.set(self.base64String, forKey: "profileImage")
                UserDefaults.standard.set(self.name, forKey: "name")
                
                //信用のおける認証を取る
    
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                FIRAuth.auth()?.signIn(with: credential){
                    (user,error) in
                    
                    if UserDefaults.standard.object(forKey: "OK") != nil {
                        
                        //1度ログインしているので飛ばします
                    } else {
                        
                        self.uuid = user!.uid
                        self.createNewUserDB()
                    }
                }
            }
            performSegue(withIdentifier: "talkroom", sender: nil)
        }
    }
    
    func createNewUserDB() {
        
        //サーバーに情報を飛ばす
        
        let firebase = FIRDatabase.database().reference(fromURL:"https://odenbus2talkroom.firebaseio.com/") //ここのurlに何かをする
        
        //サーバーに飛ばす箱を作る
        let user:NSDictionary = ["username":self.name, "profileImage":self.base64String, "uuid":self.uuid]
        
        firebase.child("users").childByAutoId().setValue(user)
        
        UserDefaults.standard.set("OK",forKey: "OK")
        
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("ログアウトしました")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
