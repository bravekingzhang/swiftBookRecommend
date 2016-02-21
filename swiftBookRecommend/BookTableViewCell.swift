//
//  BookTableViewCell.swift
//  swiftBookRecommend
//
//  Created by brzhang on 16/2/21.
//  Copyright © 2016年 brzhang. All rights reserved.
//

import UIKit
import SDWebImage

class BookTableViewCell: UITableViewCell {
	
	@IBOutlet weak var bookImage: UIImageView!
	
	@IBOutlet weak var bookName: UILabel!
	@IBOutlet weak var bookIntro: UILabel!
	var bookModel: BookModel? {
		didSet {
			bookName.text = bookModel?.bookName
			bookIntro.text = bookModel?.bookIntro
			bookImage.layer.cornerRadius = 4// 给一点圆角
			guard let imageUlr = bookModel?.bookImage else {
				bookImage.sd_setImageWithURL(NSURL(string: ""), placeholderImage: UIImage.init(named: "qidain"))
				return
			}
			bookImage.sd_setImageWithURL(NSURL(string: imageUlr), placeholderImage: UIImage.init(named: "qidain"))
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
//			/ Users / brzhang / Downloads / qidain.jpg
		// Configure the view for the selected state
	}
}
