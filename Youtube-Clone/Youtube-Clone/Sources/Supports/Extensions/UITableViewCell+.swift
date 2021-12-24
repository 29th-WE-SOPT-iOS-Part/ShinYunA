//
//  UITableViewCell+.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/12/24.
//

import UIKit

extension UITableViewCell {
    func getTableCellIndexPath() -> Int {
        var indexPath = 0
        
        guard let superView = self.superview as? UITableView else {
            return -1
        }
        indexPath = superView.indexPath(for: self)!.row
        
        return indexPath
    }
}
