//
//  SelectGameViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class SelectGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var additionButton: RoundButton!
    @IBOutlet weak var subtractionButton: RoundButton!
    @IBOutlet weak var multiplicationButton: RoundButton!
    @IBOutlet weak var divisionButton: RoundButton!
    @IBOutlet weak var writeNameTextField: UITextField!
    @IBOutlet weak var difficultyPickerView: UIPickerView!
    
    var name: String = ""
    var difficulty: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboard()
        
        self.difficultyPickerView.delegate = self
        self.difficultyPickerView.dataSource = self
        
        writeNameTextField.text! = name
        difficulty = ["Lätt", "Medium", "Svårt"]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficulty.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficulty[row]
    }
    
    @IBAction func operandButtons(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartGameSegue" {
            
            let destination = segue.destination as! GameViewController
            
            destination.addition = additionButton.isSelected
            destination.subtraction = subtractionButton.isSelected
            destination.multiplication = multiplicationButton.isSelected
            destination.division = divisionButton.isSelected
            
            if let name = writeNameTextField.text {
                destination.name = name
            }
        }
    }
    
}
