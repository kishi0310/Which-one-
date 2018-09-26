//
//  secondViewController.swift
//  Which one?
//
//  Created by 岸下和樹 on 2018/09/26.
//  Copyright © 2018年 岸下和樹. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
// デフォルトの画像を表示する
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        imageView.image = UIImage(named: "a")
        super.viewDidLoad()
    }
    @IBAction func nextPageBtn(_ sender: UIButton) {
    }
    
    //カメラロールから写真を選択する処理。
    @IBAction func choosePicture(_ sender: UIButton){
        //カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    // カメラロールから写真が選ばれたら、その写真を取得する処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得する
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // ビューに表示する
        self.imageView.image = image
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }

    //写真をリセットする処理
    @IBAction func deleteChoose(_ sender: UIButton) {
    
        // アラートで確認
        let alert = UIAlertController(title: "確認", message: "画像を初期化してもよいですか？", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler:{(action: UIAlertAction) -> Void in
            // デフォルトの画像を表示する
            self.imageView.image = UIImage(named: "default.png")
        })
        let cancelButton = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        // アラートにボタン追加
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        // アラート表示
        present(alert, animated: true, completion: nil)
    }
    
}
