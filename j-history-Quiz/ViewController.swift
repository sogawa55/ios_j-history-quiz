

import UIKit

class ViewController: UIViewController {

    @IBAction func StartButton(_ sender: Any) {
        
        //問題データの初期化
        QuestionDataManager.sharedInstance.nowQuestionIndex = 0
        QuestionDataManager.sharedInstance.questionPath = ""
        QuestionDataManager.sharedInstance.questionDataArray.removeAll()
        QuestionDataManager.sharedInstance.shuffle()
        QuestionDataManager.sharedInstance.shuffleArray.removeAll()
        QuestionDataManager.sharedInstance.array.removeAll()
        QuestionDataManager.sharedInstance.array = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

