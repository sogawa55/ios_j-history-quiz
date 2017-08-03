

import UIKit

class SelectViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
  }
    
    //回答する時代を選択する
    @IBAction func kodai(_ sender: Any) {
        //シングルトンオブジェクトのプロパティに値を設定
        QuestionDataManager.sharedInstance.questionPath = "kodai"
        //前回のデータの初期化
        PastDataManager.sharedInstance.PastDataArray.removeAll()
        
        EraData.sharedInstance.selectEra = "【原始・古代】"
    }
    
    
    @IBAction func chusei(_ sender: Any) {
        
      QuestionDataManager.sharedInstance.questionPath = "chusei"
        
        PastDataManager.sharedInstance.PastDataArray.removeAll()
        
        EraData.sharedInstance.selectEra = "【中世】"
        
    }
    
    
    @IBAction func kinsei(_ sender: Any) {
        
        QuestionDataManager.sharedInstance.questionPath = "kinsei"
        
        PastDataManager.sharedInstance.PastDataArray.removeAll()
        
        EraData.sharedInstance.selectEra = "【近世】"
    }
    
    
    
    @IBAction func kindai(_ sender: Any) {
        
        QuestionDataManager.sharedInstance.questionPath = "kindai"
        
        PastDataManager.sharedInstance.PastDataArray.removeAll()
        
        EraData.sharedInstance.selectEra = "【近代・現代】"
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        
    
    //問題データを初期化して回答画面に遷移
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        //シャッフルカウンターの初期化
        QuestionDataManager.sharedInstance.shuffleCounter = 0
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        //問題番号の設定
        QuestionDataManager.sharedInstance.questionNo = 1
        //問題キーの初期化
        QuestionDataManager.sharedInstance.nowQuestionIndex = 0
        //問題をシャッフル
        QuestionDataManager.sharedInstance.shuffle()

        //問題画面に遷移
        guard let nextViewController = segue.destination as?
            QuestionViewController else{
            return
        }
        //次の問題の読み込み
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else{
        return
        }
        //遷移先の画面に読み込んだ問題データを渡す
        nextViewController.questionData = questionData
    }
    
    @IBAction func goToSelectView(_ segue: UIStoryboardSegue){ 
    }
}

