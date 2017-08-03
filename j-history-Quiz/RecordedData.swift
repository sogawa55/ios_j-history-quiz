

import Foundation
import RealmSwift

//過去の結果を保存するデータベース生成
class RecordedData: Object{
    //選択した年代
    dynamic var RecordedEra: String = ""
    //正解率
    dynamic var RecordedScore: String = ""
    //回答時間
    dynamic var RecordedTime: String = ""
    //ランク
    dynamic var RecordedRank: String = ""
    dynamic var created = Date()
}
