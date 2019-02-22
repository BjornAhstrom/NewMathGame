//
//  GrayColorTheme.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-10.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class DarkTheme: ThemeProtocol {
    var fontForLabels: String = "Arial"
    var fontForButtons: String = "Arial"
    var colorForButtons: UIColor = UIColor(named: "ButtonColorForGrayTheme")!
    var imagesForNumPadButtons: UIImage = (UIImage(named: "GreenRoundButton") as UIImage?)!
    var colorForStartPlayAndAnswerButtons: UIColor = UIColor(named: "ColorOnAnswerAndPlayButtons")!
    var colorForQuitButtons: UIColor = UIColor(named: "ColorOnQuitButtonsBlueTheme")!
    var textColor: UIColor = UIColor(named: "TextColorForGrayTheme")!
    var backGroundColorTop: UIColor = UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1.0)
    var backGroundColorMiddle: UIColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    var backGroundColorBottom: UIColor = UIColor(red: 65.0/255.0, green: 65.0/255.0, blue: 65.0/255.0, alpha: 1.0)
}
