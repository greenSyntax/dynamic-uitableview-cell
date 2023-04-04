//
//  ContentCell.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func intialize(_ data: ContentCellData) {
        self.labelText.text = data.contentText
    }
    
}
