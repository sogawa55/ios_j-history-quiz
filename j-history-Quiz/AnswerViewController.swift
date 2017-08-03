

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    static let sharedInstance = AnswerViewController()
　　　
    //問題文テキストと回答ラベルをOutlet接続
　　　
    @IBOutlet weak var Q1Text: UITextView!
    @IBOutlet weak var A1Text: UILabel!
    
    @IBOutlet weak var Q2Text: UITextView!
    @IBOutlet weak var A2Text: UILabel!
    
    @IBOutlet weak var Q3Text: UITextView!
    @IBOutlet weak var A3Text: UILabel!
    
    @IBOutlet weak var Q4Text: UITextView!
    @IBOutlet weak var A4Text: UILabel!
    
    @IBOutlet weak var Q5Text: UITextView!
    @IBOutlet weak var A5Text: UILabel!
    
    @IBOutlet weak var Q6Text: UITextView!
    @IBOutlet weak var A6Text: UILabel!
    
    @IBOutlet weak var Q7Text: UITextView!
    @IBOutlet weak var A7Text: UILabel!
    
    @IBOutlet weak var Q8Text: UITextView!
    @IBOutlet weak var A8Text: UILabel!
    
    @IBOutlet weak var Q9Text: UITextView!
    @IBOutlet weak var A9Text: UILabel!
    
    @IBOutlet weak var Q10Text: UITextView!
    
    @IBOutlet weak var A10Text: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //回答済みデータを格納した配列から値を設定
        Q1Text.text = String(PastDataManager.sharedInstance.PastDataArray[0])
        A1Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[0])
        
        Q2Text.text = String(PastDataManager.sharedInstance.PastDataArray[1])
        A2Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[2])
        
        Q3Text.text = String(PastDataManager.sharedInstance.PastDataArray[2])
        A3Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[4])
        
        Q4Text.text = String(PastDataManager.sharedInstance.PastDataArray[3])
        A4Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[6])
        
        Q5Text.text = String(PastDataManager.sharedInstance.PastDataArray[4])
        A5Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[8])
        
        Q6Text.text = String(PastDataManager.sharedInstance.PastDataArray[5])
        A6Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[10])
        
        Q7Text.text = String(PastDataManager.sharedInstance.PastDataArray[6])
        A7Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[12])
        
        Q8Text.text = String(PastDataManager.sharedInstance.PastDataArray[7])
        A8Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[14])
        
        Q9Text.text = String(PastDataManager.sharedInstance.PastDataArray[8])
        A9Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[16])
        
        Q10Text.text = String(PastDataManager.sharedInstance.PastDataArray[9])
        A10Text.text = String(PastDataManager.sharedInstance.PastAnswerArray[18])
        
       
    }
    
    //結果画面に戻る
    @IBAction func resultViewBack(_ sender: Any) {
        
        //識別子の示す画面に遷移
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "result")
        present(nextView, animated: true, completion: nil)
    }
    
    //トップ画面に戻る
    @IBAction func TopViewback(_ sender: Any) {
        
        //識別子の示す画面に遷移
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Top")
        present(nextView, animated: true, completion: nil)
        
        //タイマーの初期化
        timerManager.sharedInstance.seconds = 0
        timerManager.sharedInstance.fractions = 0
        //回答済みデータの初期化
        PastDataManager.sharedInstance.PastAnswerArray.removeAll()
        QuestionDataManager.sharedInstance.questionDataArray.removeAll()
        
    }
    
    
}




    
