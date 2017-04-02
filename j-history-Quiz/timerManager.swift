//
//  timerManager.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/05.
//  Copyright © 2017年 history. All rights reserved.
//

import Foundation

class timerManager{
    static let sharedInstance = timerManager()

    var timer = Timer()
    var seconds:Int = 0
    var fractions:Int = 0
    var stopwatchString: String = ""
    var startStopWatch:Bool = true
    var lastTime: String = ""

}
