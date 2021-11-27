//
//  DelegatePracticeVC.swift
//  Seminar-7th
//
//  Created by SHIN YOON AH on 2021/11/27.
//

import UIKit

class DelegatePracticeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var warningLabel: UILabel!
    
    var names: [String] = []
    var selectedName: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initArray()
        configCollectionView()
    }
    
    private func configCollectionView() {
        let nibName = UINib(nibName: "KeywordCVC", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: "KeywordCVC")
        collectionView.dataSource = self
    }
    
    private func initArray() {
        names.append(contentsOf: [
            "김루희", "김선영", "김소연", "김수연", "김승찬", "김윤서", "김인환", "김지수", "김태현", "김현규", "김혜수", "박예빈", "박익범", "배은서", "송지훈", "신윤아", "안현주", "양수빈", "이경민", "이남준", "이유진", "이준호" ,"임주민", "장혜령", "정은희" ,"정정빈" ,"조양원" ,"최은주" ,"최이준" ,"홍승현", "황지은"
        ])
    }
}

extension DelegatePracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordCVC", for: indexPath) as? KeywordCVC else { return UICollectionViewCell() }
        cell.delegate = self
        cell.setKeyword(text: names[indexPath.item])
        
        cell.presentingClosure = { name in
            if name == "장혜령" {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
                nextVC.receivedText = name
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        
        return cell
    }
}

extension DelegatePracticeVC: KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC) {
        selectedName.append(cell.keyword)
        updateWarningLabel()
    }
    
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String) {
        let deletingIndex = selectedName.firstIndex(of: unselectedName) ?? -1
        selectedName.remove(at: deletingIndex)
        updateWarningLabel()
    }
    
    func updateWarningLabel() {
        warningLabel.text = "\(selectedName.count)명이 선택되었습니다."
        warningLabel.textColor = selectedName.count > 8 ? .red : .black
    }
}
