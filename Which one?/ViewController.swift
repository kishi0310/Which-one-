

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    //標準より少し小さくする(80%)
    //そっから拡大する
    //消去
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //1.80%まで縮小させる
        UIView.animate(withDuration: 0.3,
                       delay: 1.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { (Bool) in
            
        })
        
        //2.8倍まで拡大する
        UIView.animate(withDuration: 0.2,
                       delay: 1.3,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () in
                        self.imageView.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
                        self.imageView.alpha = 0
        }, completion: { (Bool) in
            //アニメーションが終わったらimageViewを消す
            self.imageView.removeFromSuperview()
        })
    }
}
