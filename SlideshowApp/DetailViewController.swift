import UIKit

class DetailViewController: UIViewController {
    //画像
    @IBOutlet weak var bigImage: UIImageView!
    //画像を受け取る用の変数
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //描画前に画像をセット
    override func viewWillLayoutSubviews() {
        bigImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
