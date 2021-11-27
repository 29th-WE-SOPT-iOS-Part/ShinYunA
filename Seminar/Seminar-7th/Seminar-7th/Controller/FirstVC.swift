//
//  FirstVC.swift
//  Seminar-7th
//
//  Created by SHIN YOON AH on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {
    static let identifier = "FirstVC"
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var textfield: UITextField!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("test"),
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentSecondVC" {
            let nextVC = segue.destination as? SecondVC
            nextVC?.receivedText = textfield.text ?? ""
        }
    }
    
    // MARK: - @IBAction
    
    @IBAction func touchupToSendData(_ sender: Any) {
       guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
//        if let text = textfield.text {
//            nextVC.receivedText = text
//        }
        present(nextVC, animated: true, completion: nil)
        
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
    }
    
    @objc
    private func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            textfield.text = text
        }
    }
}
