

import Foundation

//AnswerViewControllerに表示する回答済みデータを格納する配列を宣言
class PastDataManager{
    //シングルトンオブジェクトを生成
    static let sharedInstance = PastDataManager()
    //問題文用の配列を宣言
    var PastDataArray = [String]()
    //正解番号用の配列を宣言
    var PastAnswerArray = [String]()
    
}
