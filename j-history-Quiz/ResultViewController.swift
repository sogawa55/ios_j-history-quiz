//
//  ResultViewController.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/05.
//  Copyright © 2017年 history. All rights reserved.
//

import UIKit
import RealmSwift

//回答結果を表示
class ResultViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var correctPrecentLabel: UILabel!

    @IBOutlet weak var EraLabel: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var RankLabel: UILabel!
    
    @IBOutlet weak var RecordTable: UITableView!
    
    var RecordList: Results<RecordedData>!
    
    var questionCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionDataManager.sharedInstance.shuffle()
        
        //選択した時代を表示
        EraLabel.text = EraData.sharedInstance.selectEra
        
        //合計時間を表示
        TimeLabel.text = String(timerManager.sharedInstance.stopwatchString) + "秒"
   
        //回答した問題数をと正解数をから正解率を格納
        questionCount =
        QuestionDataManager.sharedInstance.questionDataArray.count
        var correctCount: Int = 0
        
        for questionData in QuestionDataManager.sharedInstance.questionDataArray{
            if questionData.isCorrect(){
            correctCount += 1
            }
        }
        
        let correctPercent: Float = (Float(correctCount)/Float(10)) * 100
        correctPrecentLabel.text = String(format: "%.1f", correctPercent) + "%"
        
        
        //回答率と回答時間から判定を格納
        if (correctPercent>=95.0)&&(timerManager.sharedInstance.seconds <= 10){
           
            let rank:String = "S"+"判定"
            RankLabel.text! = rank
            
        } else if (correctPercent>=85.0)&&(timerManager.sharedInstance.seconds <= 15){
        
            let rank:String = "A"+"判定"
            RankLabel.text! = rank
        
        } else if (correctPercent>=70.0)&&(timerManager.sharedInstance.seconds <= 20){
           
            let rank:String = "B"+"判定"
            RankLabel.text! = rank
           
        } else if (correctPercent>=60.0)&&(timerManager.sharedInstance.seconds <= 40){
            
            let rank:String = "C"+"判定"
            RankLabel.text! = rank
        
        } else if (correctPercent>=40.0)&&(timerManager.sharedInstance.seconds <= 60) {
            
            let rank:String = "D"+"判定"
            RankLabel.text! = rank
        
        } else {
            
            let rank:String = "E"+"判定"
            RankLabel.text! = rank
        }
        
        
        
        //realmデータベースを起動して回答結果を格納
        let recordData:RecordedData = RecordedData()
        
        recordData.RecordedEra = EraLabel.text!
        recordData.RecordedScore = correctPrecentLabel.text!
        recordData.RecordedTime = TimeLabel.text!
        recordData.RecordedRank = RankLabel.text!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(recordData)
            
            RecordList = realm.objects(RecordedData.self)
            RecordTable.reloadData()
        }
    
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    
    //過去の回答データを表示するテーブルビューを生成
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
       
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RecordListCell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordListCell
        
        let realm = try! Realm()
        RecordList = realm.objects(RecordedData.self).sorted(byKeyPath: "created", ascending: false)
        
        
        let recordData:RecordedData = self.RecordList[indexPath.row]
   
        cell.RecordEraLabel .text = RecordList[indexPath.row].RecordedEra

        cell.RecordScoreLabel .text = RecordList[indexPath.row].RecordedScore
       
        cell.RecordTimeLabel .text = RecordList[indexPath.row].RecordedTime
        
        cell.RecordRankLabel .text = RecordList[indexPath.row].RecordedRank
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd' 'HH:mm:ss"
        cell.RecordDateLabel.text = formatter.string(from: recordData.created)
        
        return cell
      
    }
    
    //回答データをSNSにシェア
    @IBAction func Share(_ sender: Any) {
        
    let text = "最難関の日本史：" + String(EraLabel.text!)  + "回答時間：" + String(TimeLabel.text!) + "／" + "正答率：" + String(correctPrecentLabel.text!) + "／" + String(RankLabel.text!)

        let items = [text] as [Any]!
        
        let activityVc = UIActivityViewController(activityItems: items!, applicationActivities: nil)
        
        self.present(activityVc, animated: true, completion: nil)
        
    }
    
    //回答データを初期化してトップ画面に戻る
    @IBAction func goToTitle(_ sender: Any) {
        
        QuestionDataManager.sharedInstance.questionPath = ""
        timerManager.sharedInstance.seconds = 0
        timerManager.sharedInstance.fractions = 0
        PastDataManager.sharedInstance.PastAnswerArray.removeAll()
        QuestionDataManager.sharedInstance.questionDataArray.removeAll()

        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "Top")
        present(nextView, animated: true, completion: nil)
        
    }
    
}


