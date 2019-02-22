//
//  BlueColorTheme.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-10.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ColorTheme: ThemeProtocol {
    var fontForLabels: String = "MarkerFelt-Thin"
    var fontForButtons: String = "Chalkduster"
    var colorForButtons: UIColor = UIColor(named: "ButtonColorForBlueTheme")!
    var imagesForNumPadButtons: UIImage = (UIImage(named: "GreenRoundButton") as UIImage?)!
    var colorForStartPlayAndAnswerButtons: UIColor = UIColor(named: "ColorOnAnswerAndPlayButtons")!
    var colorForQuitButtons: UIColor = UIColor(named: "ColorOnQuitButtonsBlueTheme")!
    var textColor: UIColor = UIColor(named: "TextColorForColorTheme")!
    var backGroundColorTop: UIColor = UIColor(red: 0.0/255.0, green: 191.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    var backGroundColorMiddle: UIColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    var backGroundColorBottom: UIColor = UIColor(red: 65.0/255.0, green: 105.0/255.0, blue: 225.0/255.0, alpha: 1.0)
}
