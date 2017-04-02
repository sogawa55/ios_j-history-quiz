//
//  QuestionData.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/04.
//  Copyright © 2017年 history. All rights reserved.
//

import Foundation

class QuestionData{
    
    //問題データを格納する変数の宣言
    
    var question: String
    
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    var correctAnswerNumber: Int
    
    var correctAnswer: String
    
    var userChoiceAnswerNumber: Int?
    
    //宣言した変数に初期値としてCSVから読み込み、配列に値を格納
    
    init(questionSourceDataArray: [String]){
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
        correctAnswer = questionSourceDataArray[6]
    }
    
    
 
    func isCorrect() -> Bool {
        if correctAnswerNumber == userChoiceAnswerNumber{
           return true
        }
           return false
    }
}




class QuestionDataManager{
    static let sharedInstance = QuestionDataManager()
    
    var questionNo: Int = 1
    
    var questionDataArray = [QuestionData]()
    
    var PastData:Int = 0
    
    var nowQuestionIndex: Int = 0
    
    var shuffleCounter:Int = 0
    
    var questionPath = ""

    private init()
    {
        
    }
    
    //CSVから問題データを取得
    func loadQuestion(){
        
        guard let csvFilePath = Bundle.main.path(forResource: QuestionDataManager.sharedInstance.questionPath, ofType: "csv")else{
        print("csvファイルが存在しません")
        return
        }
        
        print(csvFilePath)

        
        do{
            let csvStringData = try String(contentsOfFile: csvFilePath,
                                           encoding: String.Encoding.utf8)
            csvStringData.enumerateLines(invoking: { (line, stop) in
               let questionSourceDataArray =
                line.components(separatedBy: ",")
                let questionData = QuestionData(questionSourceDataArray:
                    questionSourceDataArray)
                self.questionDataArray.append(questionData)
                
                
              
                  })
        } catch let error {
            print("csvファイル読み込みエラーが発生しました。:\(error)")
        }
        return
    }
 
    //問題をランダムにする配列を作成
    var array = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
   
    var shuffleArray = Array<String>()
    
    func shuffle(){
        
        
        
        for _ in 0 ..< array.count {
            shuffleArray.append(array.remove(at:Int(arc4random_uniform(UInt32(array.count)))))
        }
    }
    
    

    //問題を格納したデータにランダムしたキー番号を付与
    func nextQuestion() -> QuestionData?{
        
        
        if shuffleCounter <  10 {
            nowQuestionIndex = Int(shuffleArray[shuffleCounter])!
           
            let nextQuestion = questionDataArray[nowQuestionIndex]
            shuffleCounter += 1
            return nextQuestion
            
    }
     return nil
    
  }
    
}









