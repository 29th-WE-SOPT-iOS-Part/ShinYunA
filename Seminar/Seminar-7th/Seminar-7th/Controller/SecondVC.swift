//
//  SecondVC.swift
//  Seminar-7th
//
//  Created by SHIN YOON AH on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {
    static let identifier = "SecondVC"
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: - Properties
    
    var receivedText = ""
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = receivedText
    }
    
    // MARK: - @IBAction
    
    @IBAction func touchupToSendData(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("test"), object: textfield.text ?? "")
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textfield.text = textfield.text
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Public Methods
    
    func setDataInTextField(data: String) {
        textfield.text = data
    }
}
