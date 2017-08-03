

import Foundation

class timerManager{
    //シングルトンオブジェクトを生成
    static let sharedInstance = timerManager()
　　//プロパティの初期化
    var timer = Timer()
    var seconds:Int = 0
    var fractions:Int = 0
    var stopwatchString: String = ""
    var startStopWatch:Bool = true
    var lastTime: String = ""

}
