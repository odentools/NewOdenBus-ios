//
//  TalkViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/14.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase


class TalkViewController: JSQMessagesViewController {
    
    var decodedImage = UIImage()
    var decodedImage2 = UIImage()
    
    var cellNumber:Int = 0
    
    var roomName = String()
    
    var messages:[JSQMessage]! = [JSQMessage]() //メッセージが入る配列を準備

    var incomingBubble:JSQMessagesBubbleImage!
    var outgoingBubble:JSQMessagesBubbleImage!
    var incomingAvatar:JSQMessagesAvatarImage!
    var outgoingAvatar:JSQMessagesAvatarImage!
    
    
    var roomNameLabelText = String()
    
    var backgroundImageView = UIImageView()
    
    
    @IBOutlet var roomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           backgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        //背景画面を反映
        if UserDefaults.standard.object(forKey: "backImage") != nil {
            
            let decodeData = UserDefaults.standard.object(forKey: "backImage")
            
            let decodedData = NSData(base64Encoded: decodeData as! String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
            let decodedImage10 = UIImage(data:decodedData! as Data)
            backgroundImageView.image = decodedImage10
            self.collectionView?.backgroundView = backgroundImageView
            
        }
        
        //ルームの名前を反映させる
        roomLabel.text = roomName
        
        //チャットをスタートさせる
        chatStart()
        
        //情報をリアルタイムで取得する
        getInfo()

        //アバターはなし
        self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero

    }
    
    func chatStart() {
        //チャットオートスクロール
        inputToolbar!.contentView!.leftBarButtonItem = nil
        
        automaticallyAdjustsScrollViewInsets = true
        
        if UserDefaults.standard.object(forKey: "name") != nil {
            
            self.senderId = FIRAuth.auth()?.currentUser?.uid
            self.senderDisplayName = UserDefaults.standard.object(forKey: "name") as? String!
        }
        //吹き出しの設定
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        self.incomingBubble = bubbleFactory?.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleLightGray())
        
        self.outgoingBubble = bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleBlue())
        
        self.incomingAvatar = JSQMessagesAvatarImageFactory.avatarImage(with: decodedImage2, diameter: 64)
        self.outgoingAvatar = JSQMessagesAvatarImageFactory.avatarImage(withPlaceholder: decodedImage, diameter: 64)
        //メッセージの配列の初期化
        self.messages = []
        
        
        
        
    }
    
    func getInfo() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let firebase = FIRDatabase.database().reference(fromURL: "https://odenbus2talkroom.firebaseio.com/").child(String(cellNumber)).child("message")
        
        firebase.observe(.childAdded,with:{
            (snapshot) in
            
            if let dictionary = snapshot.value as? [String:AnyObject]{
                
                let snapshotValue = snapshot.value as! NSDictionary
                snapshotValue.setValuesForKeys(dictionary)
                let text = snapshotValue["text"] as! String
                let senderId = snapshotValue["from"] as! String
                let name = snapshotValue["name"] as! String
                let message = JSQMessage(senderId: senderId, displayName: name, text: text)
                self.messages?.append(message!)
                self.finishReceivingMessage()
                
            }
            
            
        })
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    //メッセージの位置を決める
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath as IndexPath) as? JSQMessagesCollectionViewCell
        
        if messages[indexPath.row].senderId == senderId {
            
            cell?.textView.textColor = UIColor.white
        }else{
            cell?.textView?.textColor = UIColor.darkGray
        }
        return cell!
    }
    
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        let rootRef = FIRDatabase.database().reference(fromURL: "https://odenbus2talkroom.firebaseio.com/").child(String(cellNumber)).child("message")
        
        let timestamp = Int(NSDate().timeIntervalSince1970)
        let post:Dictionary<String,Any>? = ["from":senderId,"name":senderDisplayName,"text":text,"timestamp":timestamp]
        
        let postRef = rootRef.childByAutoId()
        postRef.setValue(post)
        
        self.inputToolbar.contentView.textView.text = ""
        
    }

    //参照するイメージを渡す
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return self.messages?[indexPath.item]
    }
    
    //背景を返す
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        let message =  self.messages?[indexPath.row]
        
        if message?.senderId  == senderId {
            
            return self.outgoingBubble
            
        }else{
            
            return self.incomingBubble
            
        }
    }
    
    
    //アバターを返す
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let message =  self.messages?[indexPath.row]
        
        if message?.senderId  == senderId {
            
            return self.outgoingAvatar
            
        }else{
            
            return self.incomingAvatar
            
        }
        
    }
        
    
    //メッセージの総数を返す
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.messages.count
        
    }
    
    //戻るボタン
    @IBAction func back6(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    //送信時刻を出すための高さを調整
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForCellTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = self.messages?[indexPath.row]
        
        if indexPath.row == 0 {
            
            return JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: message!.date)
        }
        if indexPath.row - 1 > 0 {
            let previousMessage = self.messages?[indexPath.row - 1]
            
            if (message?.date.timeIntervalSince((previousMessage?.date)!))! / 60 > 1 {
                
                return JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: message?.date)
            }
            
        }
        return nil
    }

    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForCellBottomLabelAt indexPath: IndexPath!) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return  kJSQMessagesCollectionViewCellLabelHeightDefault
        }
        
        if indexPath.row - 1 > 0 {
        
            let previousMessage = self.messages?[indexPath.row - 1]
            
            let message = self.messages[indexPath.row]
            
            if message.date.timeIntervalSince((previousMessage?.date)!) / 60 > 1 {
                return kJSQMessagesCollectionViewCellLabelHeightDefault
            }
        
        }
        return 0.0
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
