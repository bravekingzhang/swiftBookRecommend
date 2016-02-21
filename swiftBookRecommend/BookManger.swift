//
//  BookManger.swift
//  swiftBookRecommend
//
//  Created by brzhang on 16/2/21.
//  Copyright © 2016年 brzhang. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class BookManger {
	var delegate: RecommedBookLoadDelegate?
	func loadRecommedFromNet() {
		
		Alamofire.request(.GET, "http://localhost/php/listRecommedBook.php")
			.response { [unowned self] request, response, data, error in
				if error == nil {
					let json = JSON(data: data!)
					var recommendBooks: [BookModel] = []
					for i in Range(start: 0, end: json.count) {
						let bookModel = BookModel()
						bookModel.bookName = json[i] ["book_name"].stringValue
						bookModel.bookDetailUrl = json[i] ["url"].stringValue
						bookModel.bookImage = json[i] ["book_pic"].stringValue
						bookModel.bookIntro = json[i] ["book_some_detail"].stringValue
						recommendBooks.append(bookModel)
					}
					self.delegate?.loadRecommedBookSuccess(recommendBooks)
				} else {
					self.delegate?.failLoadRecommendBook(error)
				}
			}
	}
}

protocol RecommedBookLoadDelegate {
	func loadRecommedBookSuccess(recommendBooks: [BookModel])
	func failLoadRecommendBook(error: NSError?)
}