//
//  RecordListCell.swift
//  j-history-Quiz
//
//  Created by shohei on 2017/03/12.
//  Copyright © 2017年 history. All rights reserved.
//

import UIKit

//データベースに格納した過去の回答データを表示するラベル
class RecordListCell: UITableViewCell {
    
    
    @IBOutlet weak var RecordDateLabel: UILabel!
  
    @IBOutlet weak var RecordEraLabel: UILabel!
    
    
    @IBOutlet weak var RecordScoreLabel: UILabel!

    @IBOutlet weak var RecordTimeLabel: UILabel!
    
    @IBOutlet weak var RecordRankLabel: UILabel!
    
        override func layoutSubviews() {
            super.layoutSubviews()
        
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
