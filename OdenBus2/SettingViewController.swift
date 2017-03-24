//
//  SettingViewController.swift
//  OdenBus2
//
//  Created by 奥村晋太郎 on 2017/02/15.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var backgroundImage = UIImage()
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var profileNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "profileImage") != nil {
            
            //デコードして取り出す
            let decodeData = UserDefaults.standard.object(forKey: "profileImage")
            
            //String -> Data
            let decodedData = NSData(base64Encoded: decodeData as! String, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
            //Data -> UIImage
            let decodedImage = UIImage(data: decodedData! as Data)
            
            //profileImageにデコードしたデータを表示させる
            profileImageView.image = decodedImage
            
            //proflieNameLabelにViewControllerからString型のnameを取ってくる
            profileNameLabel.text = UserDefaults.standard.object(forKey: "name") as? String
            
        }else{
            
        }


    }
    
    
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }

    }
    
    
    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            backgroundImage = pickedImage
            
        }
        //カメラ画面(アルバム画面)を閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func back5(_ sender: Any) {
        
        if UserDefaults.standard.object(forKey: "backImage") != nil {
            
            let decodeData = UserDefaults.standard.object(forKey: "backImage")
            
            let decodedData = NSData(base64Encoded: decodeData as! String , options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
            let decodedImage =  UIImage(data:decodedData! as Data)
            
            backgroundImage = decodedImage!
        }
        
        var data:NSData = NSData()
        
        if backgroundImage.size.width != 0{
            
            data = UIImageJPEGRepresentation(backgroundImage, 0.1)! as NSData
            
            let base64String = data.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters) as String
            
            UserDefaults.standard.set(base64String, forKey: "backImage")
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
