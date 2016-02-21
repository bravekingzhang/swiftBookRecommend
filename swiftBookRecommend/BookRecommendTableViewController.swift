//
//  BookRecommendTableViewController.swift
//  swiftBookRecommend
//
//  Created by brzhang on 16/2/21.
//  Copyright © 2016年 brzhang. All rights reserved.
//

import UIKit

class BookRecommendTableViewController: UITableViewController {
	
	var recommendBooks: [BookModel] = []
	var bookManger = BookManger()
	let bookReuseIdentifier = "bookReuseIdentifier"
	let bookDetailView = BookDetailview()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 设置代理，拿到数据之后通知UI
		bookManger.delegate = self
		bookManger.loadRecommedFromNet()
		self.view.makeToastActivity()
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return recommendBooks.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(bookReuseIdentifier, forIndexPath: indexPath) as! BookTableViewCell
		cell.bookModel = recommendBooks[indexPath.row]
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let bookModel = recommendBooks[indexPath.row]
		
		bookDetailView.title = bookModel.bookName
		bookDetailView.loadWeb(bookModel.bookDetailUrl)
		// 这里完全可以用segue来搞定，但是偶尔还是要尝试一下代码的方式。
		self.navigationController?.pushViewController(bookDetailView, animated: true)
	}
	
	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */
}

extension BookRecommendTableViewController: RecommedBookLoadDelegate {
	func loadRecommedBookSuccess(recommendBooks: [BookModel]) {
		self.view.hideToastActivity()
		self.recommendBooks = recommendBooks
		self.tableView.reloadData()
	}
	func failLoadRecommendBook(error: NSError?) {
		self.view.hideToastActivity()
	}
}
