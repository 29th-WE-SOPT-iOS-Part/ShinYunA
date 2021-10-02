//
//  ViewController.swift
//  firstSeminar
//
//  Created by SHIN YOON AH on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    var isTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let favorite = UIAction(title: "HI Hyerong", image: UIImage(systemName: "heart"), handler: { _ in print("hi hyerong") })
        let cancel = UIAction(title: "흠흠 취소 좀 하겠습니다.", attributes: .destructive, handler: { _ in print("취소") })

        menuButton.menu = UIMenu(title: "혜령이를 러브하는 나의 맘?", image: UIImage(systemName: "heart.fill"), identifier: nil, options: .displayInline, children: [favorite, cancel])
        menuButton.showsMenuAsPrimaryAction = true
    }

    @IBAction func didTapToGoHyeRong(_ sender: Any) {
        if !isTapped {
            titleLabel.text = "혜령 맘속은 역시 Heaven이었구나...."
            titleLabel.textColor = .systemGreen
        } else {
            titleLabel.text = "혜령 가자!! 혜령 가자!!! 장혜령 가보자고!!!"
            titleLabel.textColor = .systemRed
        }
        
        isTapped.toggle()
    }
    
    @IBAction func didTapToPresent(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @IBAction func didTapToPush(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func didTapToCurl(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        
        vc.sendData = { text in
            self.titleLabel.text = text
        }
        
        present(vc, animated: true, completion: nil)
    }
}

