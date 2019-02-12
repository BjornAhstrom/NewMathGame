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

class SelectGameViewController: ColorViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var additionButton: RoundButton!
    @IBOutlet weak var subtractionButton: RoundButton!
    @IBOutlet weak var multiplicationButton: RoundButton!
    @IBOutlet weak var divisionButton: RoundButton!
    @IBOutlet weak var writeNameTextField: UITextField!
    @IBOutlet weak var difficultyPickerView: UIPickerView!
    @IBOutlet weak var selectTextLabel: UILabel!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var subtractionLabel: UILabel!
    @IBOutlet weak var multiplicationLabel: UILabel!
    @IBOutlet weak var divisionLabel: UILabel!
    
    var savedValueFromPickerView: Int = 0
    var name: String = ""
    var difficulty: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontOnLabel()
        fontAndImagesOnButtons()
        hideKeyboard()
        
        self.difficultyPickerView.delegate = self
        self.difficultyPickerView.dataSource = self
        
        let defaultPickerRow  =  difficultyPickerView.numberOfRows(inComponent: 0)
        difficultyPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(difficultyPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
        writeNameTextField.text! = name
        difficulty = [NSLocalizedString("select_easy", comment: ""), NSLocalizedString("select_medium", comment: ""), NSLocalizedString("select_difficult", comment: "")]
    }
    
    func fontAndImagesOnButtons() {
        backButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 40)
        startGameButton.setBackgroundImage(Theme.current.imagesOnStartPlayAndAnswerButtons, for: .normal)
        startGameButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 25)
    }
    
    func fontOnLabel() {
        selectTextLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        writeNameTextField.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        chooseLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        chooseLabel.numberOfLines = 2
        
        additionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        subtractionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        multiplicationLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        divisionLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficulty.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let difficult = difficulty[row]
        
        return "\(difficult)"
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: Theme.current.fontForLabels, size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = difficulty[row]
        pickerLabel?.textColor = UIColor.magenta
        
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        savedValueFromPickerView = row
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
            destination.valueFromPickerView = savedValueFromPickerView
            //destination.startGameTimer = true
            
            if let name = writeNameTextField.text {
                destination.name = name
            }
        }
    }
}

