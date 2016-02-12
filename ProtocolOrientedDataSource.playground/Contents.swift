//: Playground - noun: a place where people can play

import UIKit
import XCPlayground



public protocol TableViewDataSource: class, UITableViewDataSource {

}
let reuseid = "CELL"

extension TableViewDataSource {
   public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell =  tableview.dequeueReusableCellWithIdentifier(reuseid)
        cell?.backgroundColor = UIColor.blackColor()
        cell?.textLabel?.text = "Hello"
        return cell ?? UITableViewCell()
    }
}

class Movie: NSObject, TableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  UITableViewCell()

        cell.textLabel?.text = "Hello"
        return cell

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}


let tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 250, height: 400))
    let movie = Movie()

    tableview.dataSource = movie


XCPlaygroundPage.currentPage.liveView = tableview

