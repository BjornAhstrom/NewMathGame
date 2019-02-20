//
//  SelectDifficultyLevelPopupViewController.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-15.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class SelectDifficultyLevelPopupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 @IBOutlet weak var difficultyPickerView: UIPickerView!
    
    var savedValueFromPickerView: Int = 0
    var difficulty: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.difficultyPickerView.delegate = self
        self.difficultyPickerView.dataSource = self
        
        let defaultPickerRow  =  difficultyPickerView.numberOfRows(inComponent: 0)
        difficultyPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(difficultyPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
        
        difficulty = [NSLocalizedString("select_easy", comment: ""), NSLocalizedString("select_medium", comment: ""), NSLocalizedString("select_difficult", comment: "")]

    }
    
    
    @IBAction func choosDifficultyLevelButton(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "exerciseMath") as! ExerciseOnMathViewController
        self.present(nextViewController, animated:true, completion:nil)
        nextViewController.ValueFromPickerView = savedValueFromPickerView
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
        print(savedValueFromPickerView)
    }
}
