//
//  QuestionSelectViewController.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/05.
//  Copyright © 2017年 history. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    
    
  }
    
    //時代を選択する

    @IBAction func kodai(_ sender: Any) {
        
        
        QuestionDataManager.sharedInstance.questionPath = "kodai"
        
        
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
       
        QuestionDataManager.sharedInstance.shuffleCounter = 0
        QuestionDataManager.sharedInstance.loadQuestion()
        QuestionDataManager.sharedInstance.questionNo = 1
        QuestionDataManager.sharedInstance.nowQuestionIndex = 0
        QuestionDataManager.sharedInstance.shuffle()

        
        
        guard let nextViewController = segue.destination as?
            QuestionViewController else{
            return
        }
        
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else{
        return
        }
        nextViewController.questionData = questionData
    }
    
 
    
    @IBAction func goToSelectView(_ segue: UIStoryboardSegue){
        

       
    }
}

