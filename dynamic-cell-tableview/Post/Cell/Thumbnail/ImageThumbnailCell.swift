//
//  ImageThumbnailCell.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class ImageThumbnailCell: UITableViewCell {
    
    @IBOutlet weak var imageThumbnail: UIImageView!
    
    var handlerUpdateView: (() -> Void)?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func intialize(_ data: ThumbnailCellData) {
        guard let url = URL(string: data.thumbnailImage) else { return }
        ImageCacher.shared.getImage(url) { [weak self] image in
            self?.imageThumbnail.image = image
            self?.handlerUpdateView?()
        }
    }
}
