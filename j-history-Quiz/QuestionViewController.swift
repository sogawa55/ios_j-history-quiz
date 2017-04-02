//
//  QuestionViewController.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/05.
//  Copyright © 2017年 history. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController{

    //QuestionViewControllerに表示するラベルを接続

    var questionData: QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!

    
    @IBOutlet weak var answer1Button: UIButton!

    @IBOutlet weak var answer2Button: UIButton!
    
    @IBOutlet weak var answer3Button: UIButton!
    
    
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
  
    
    @IBOutlet weak var correctImageView: UIImageView!
    
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    var timer = Timer()
    
    var pastQuestion = [String]()
    
    var answer: String = ""
    
    //タイマーを起動
    func updateStopwatch() {
        
        timerManager.sharedInstance.fractions += 1
        if timerManager.sharedInstance.fractions == 100 {
            timerManager.sharedInstance.seconds += 1
            timerManager.sharedInstance.fractions = 0
        }
        let fractionsString = timerManager.sharedInstance.fractions > 9 ? "\(timerManager.sharedInstance.fractions)" : "0\(timerManager.sharedInstance.fractions)"
        let secondsString = timerManager.sharedInstance.seconds > 9 ? "\(timerManager.sharedInstance.seconds)" : "0\(timerManager.sharedInstance.seconds)"
        
        timerManager.sharedInstance.stopwatchString = "\(secondsString).\(fractionsString)"
        timerLabel.text = timerManager.sharedInstance.stopwatchString
    }


    
    override func viewDidLoad(){
    super.viewDidLoad()
        

            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(QuestionViewController.updateStopwatch), userInfo: nil, repeats: true)
        
        //ラベルに問題データを格納
        questionNoLabel?.text = "Q.\(QuestionDataManager.sharedInstance.questionNo)"
        
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for:UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)
        answer = questionData.correctAnswer
        
        //AnswerViewControllerに表示する回答済みデータを配列に格納
         var pastQuestion = [String]()
         pastQuestion.append(questionData.question)
        
        for i in pastQuestion {
         
            PastDataManager.sharedInstance.PastDataArray.append(i)
        
        }
        
         var pastAnswer = [String]()
         pastAnswer.append(questionData.correctAnswer)
        
        for i in pastAnswer {
            
            PastDataManager.sharedInstance.PastAnswerArray.append(i)
            
            print(PastDataManager.sharedInstance.PastAnswerArray.append(i))
            
        }

        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //回答ボタンを押した際に次の問題を読み込み、タイマーを一時停止
    
    @IBAction func tapAnswer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
        stopTimer()
        
    }
    
    @IBAction func tap2AnswerButton(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
        stopTimer()
    }
    
    @IBAction func tap3AnswerButton(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
        stopTimer()
    }
    
    @IBAction func tap4AnswerButton(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
        stopTimer()
    }
    
    
    
    //回答ボタンを押した際にのアニメーションを読み込み、タイマーを一時停止
    func goNextQuestionWithAnimation(){
        if questionData.isCorrect(){
        goNextQuestionWithCorrectAnimation()
        }else{
          goNextQuestionWithIncorrectAnimation()
        
        }
    }
    
    //正解のアニメーションとサウンドを出力
    func goNextQuestionWithCorrectAnimation(){
        AudioServicesPlayAlertSound(1110)
        
        UIView.animate(withDuration: 0.5, animations:{self.correctImageView.alpha = 1.0}){
            (Bool) in self.goNextQuestion()
        }
    }
    
    //不正解のアニメーションとサウンドを出力
    func goNextQuestionWithIncorrectAnimation(){
        AudioServicesPlayAlertSound(1112)
        
        UIView.animate(withDuration: 0.5, animations:{self.incorrectImageView.alpha = 1.0}){
            (Bool) in self.goNextQuestion()
        }
}
            
    
    //次の問題を読み込む、問題がなければ結果画面を表示
    func goNextQuestion(){
        
    QuestionDataManager.sharedInstance.questionNo += 1
        
        guard let nextQuestion =
            QuestionDataManager.sharedInstance.nextQuestion() else {
                if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                    present(resultViewController, animated: true, completion: nil)
                }
                return
        }
        
        
        if let nextQuestionViewController =
            storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController{
            nextQuestionViewController.questionData = nextQuestion
            present(nextQuestionViewController, animated: true, completion: nil)
            
        }
        
    }
    
    //タイマーを一時停止
    func stopTimer(){
    timer.invalidate()
    
    }
    



}
