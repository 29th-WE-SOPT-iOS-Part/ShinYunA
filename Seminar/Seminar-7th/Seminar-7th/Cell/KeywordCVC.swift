//
//  KeywordCVC.swift
//  Seminar-7th
//
//  Created by SHIN YOON AH on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate: AnyObject {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {

    @IBOutlet weak var keywordButton: UIButton!
    
    var keyword: String = ""
    var selectedKeyword: Bool = false
    
    weak var delegate: KeywordCellDelegate?
    
    var presentingClosure: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func touchupToSelect(_ sender: Any) {
        if selectedKeyword {
            delegate?.keywordCellUnselected(cell: self,
                                            unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        } else {
            delegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .systemYellow
            presentingClosure?(keyword)
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(text, for: .normal)
    }
}
