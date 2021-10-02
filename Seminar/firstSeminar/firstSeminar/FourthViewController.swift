//
//  FourthViewController.swift
//  firstSeminar
//
//  Created by SHIN YOON AH on 2021/10/02.
//

import UIKit

class FourthViewController: UIViewController {
    var sendData: ((String) -> ())?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapToSendData(_ sender: Any) {
        if let text = textField.text {
            sendData?(text)
        }
        dismiss(animated: true, completion: nil)
    }
}
