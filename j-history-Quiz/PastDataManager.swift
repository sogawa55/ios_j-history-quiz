//
//  PastData.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/07.
//  Copyright © 2017年 history. All rights reserved.
//

import Foundation

//AnswerViewControllerに表示する回答済みデータを格納する配列を宣言
class PastDataManager{
    static let sharedInstance = PastDataManager()
    
    var PastDataArray = [String]()
    
    var PastAnswerArray = [String]()
    
}
