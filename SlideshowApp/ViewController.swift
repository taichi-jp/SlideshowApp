import UIKit

class ViewController: UIViewController {
    
    //画像
    @IBOutlet weak var smallImage: UIImageView!
    //画像データ
    let image1 = UIImage(named: "image1")
    let image2 = UIImage(named: "image2")
    let image3 = UIImage(named: "image3")
    //画像をまとめるリスト
    var list: [UIImage] = []
    //画像の番号を管理する変数
    var count: Int = 0
    //再生中かどうか管理する変数
    var isStart: Bool = false
    //戻る/進むボタン
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    //再生/停止ボタンOutlet
    @IBOutlet weak var startButton: UIButton!
    //タイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //画像をセット
        list = [image1!, image2!, image3!]
        smallImage.image = list[count]
    }
    
    //戻るボタン
    @IBAction func goBack(_ sender: Any) {
        if count == 0{
            count = 2
        }else{
            count -= 1
        }
        smallImage.image = list[count]
    }
    
    //進むボタン
    @IBAction func goForward(_ sender: Any) {
        if count == 2{
            count = 0
        }else{
            count += 1
        }
        smallImage.image = list[count]
    }
    
    //再生/停止ボタンAction
    @IBAction func start(_ sender: Any) {
        if isStart == false{//停止の時
            
            //訂正
            backButton.isEnabled = false
            forwardButton.isEnabled = false
            
            startButton.setTitle("停止", for: .normal)
            self.timer = timer ?? Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goNext), userInfo: nil, repeats: true)
            isStart = true
        }else{//再生の時
            startButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
            isStart = false
            
            //訂正
            backButton.isEnabled = true
            forwardButton.isEnabled = true
        }
    }
    
    //再生用メソッド
    func goNext() {
        if count == 2{
            count = 0
        }else{
            count += 1
        }
        smallImage.image = list[count]
    }
    
    //拡大用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController:DetailViewController = segue.destination as! DetailViewController
        detailViewController.image = list[count]
        
        //訂正
        startButton.setTitle("再生", for: .normal)
        self.timer.invalidate()
        self.timer = nil
        backButton.isEnabled = true
        forwardButton.isEnabled = true
        isStart = false
    }
    
    //遷移先から戻る
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

