//
//  swipeViewController.swift
//  Which one?
//
//  Created by 岸下和樹 on 2018/09/26.
//  Copyright © 2018年 岸下和樹. All rights reserved.
//

import UIKit

class swipeViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    
        var divisionParam: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisionParam = (view.frame.size.width/2)/0.61
    }
    
    @IBAction func panGestureValueChanged(_ sender: UIPanGestureRecognizer) {
        //下の3行あたりでスワイプカードの中心地を決めている
        let cardView = sender.view!
        let translationPoint = sender.translation(in: view)
        cardView.center = CGPoint(x: view.center.x+translationPoint.x, y: view.center.y+translationPoint.y)
        
        let distanceMoved = cardView.center.x - view.center.x
        
        //Tilt your card
        cardView.transform = CGAffineTransform(rotationAngle: distanceMoved/divisionParam)
        
        if sender.state == UIGestureRecognizerState.ended {
            if cardView.center.x < 20 { //左に動いたとき！
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x-200, y: cardView.center.y)
                })
                return
            }
            else if (cardView.center.x > (view.frame.size.width-20)) { //右に動いたとき！
                UIView.animate(withDuration: 0.3, animations: {
                    cardView.center = CGPoint(x: cardView.center.x+200, y: cardView.center.y)
                })
                return
            }
            UIView.animate(withDuration: 0.2, animations: {
                self.resetCardViewToOriginalPosition()
            })
        }
    }
    
    func resetCardViewToOriginalPosition(){
        cardView.center = self.view.center
        cardView.transform = .identity
    }
}
    


