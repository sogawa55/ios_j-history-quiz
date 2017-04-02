//
//  Record.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/12.
//  Copyright © 2017年 history. All rights reserved.
//

import Foundation
import RealmSwift

//過去の結果を保存するデータベース生成
class RecordedData: Object{
  
    dynamic var RecordedEra: String = ""
    
    dynamic var RecordedScore: String = ""
    
    dynamic var RecordedTime: String = ""
    
    dynamic var RecordedRank: String = ""
   
    dynamic var created = Date()
}
