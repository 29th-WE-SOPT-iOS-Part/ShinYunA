//
//  GestureVC.swift
//  Seminar-7th
//
//  Created by SHIN YOON AH on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var tapView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapBackView(gestureRecognizer:)))
        
        tapView.addGestureRecognizer(tapRecognizer)
        view.addGestureRecognizer(tapRecognizer2)
    }
    
    @objc
    private func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("tap tap")
    }
    
    @objc
    private func tapBackView(gestureRecognizer: UIGestureRecognizer) {
        print("back tap tap!!!")
    }
}
