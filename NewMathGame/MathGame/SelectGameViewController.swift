//
//  SelectGameViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-01-23.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SelectGameViewController: ColorViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var writeNameTextField: UITextField!
    @IBOutlet weak var difficultyPickerView: UIPickerView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var chooseCountingMethodLabel: UILabel!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var allCheckBoxButtons: [UIButton]!
    
    var name: String = ""
    var savedValueFromPickerView: Int = 0
    var difficulty: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        fontAndColorsOnStartAndBackButtons()
        hideKeyboard()

        writeNameTextField.delegate = self
        self.difficultyPickerView.delegate = self
        self.difficultyPickerView.dataSource = self
        
        let defaultPickerRow  =  difficultyPickerView.numberOfRows(inComponent: 0)
        difficultyPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(difficultyPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
        writeNameTextField.text! = name
        difficulty = [NSLocalizedString("select_easy", comment: ""), NSLocalizedString("select_medium", comment: ""), NSLocalizedString("select_difficult", comment: "")]
        print("\(savedValueFromPickerView)")

    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        writeNameTextField.resignFirstResponder()
        return true
    }
    
    func fontAndColorsOnStartAndBackButtons() {
        chooseCountingMethodLabel.numberOfLines = 2
        backButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 40)
        backButton.setTitleColor(Theme.current.textColor, for: .normal)
        startGameButton.layer.cornerRadius = 10
        startGameButton.layer.shadowColor = UIColor.white.cgColor
        startGameButton.layer.shadowRadius = 5
        startGameButton.layer.shadowOpacity = 2
        startGameButton.backgroundColor = Theme.current.colorOnStartPlayAndAnswerButtons
        startGameButton.titleLabel?.font = UIFont(name: Theme.current.fontForButtons, size: 30)
        startGameButton.setTitleColor(Theme.current.textColor, for: .normal)
        writeNameTextField.font = UIFont(name: Theme.current.fontForLabels, size: 25)
        writeNameTextField.textColor = Theme.current.textColor
        
        for checkButtons in allCheckBoxButtons {
            checkButtons.layer.borderWidth = 1
            checkButtons.layer.borderColor = UIColor.black.cgColor
            checkButtons.layer.cornerRadius = 10
        }
        
        for fontOnLabel in labels {
            fontOnLabel.font = UIFont(name: Theme.current.fontForLabels, size: 25)
            fontOnLabel.textColor = Theme.current.textColor
        }
    }
    
    @IBAction func buttonsWithAnimation(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity }, completion: { Void in() })
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
    
    @IBAction func operandButton(_ sender: UIButton) {
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
            
            if let name = writeNameTextField.text {
                destination.name = name
            }
        }
    }
}

