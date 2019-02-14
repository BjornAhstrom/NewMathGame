//
//  GrayColorTheme.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-10.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class GrayColorTheme: ThemeProtocol {
    var fontForLabels: String = "MarkerFelt-Thin"
    var fontForButtons: String = "Chalkduster"
    var colorOnButtons: UIColor = UIColor(named: "ButtonColorForGrayTheme")!
    var imagesOnNumPadButtons: UIImage = (UIImage(named: "GreenRoundButton") as UIImage?)!
    var colorOnStartPlayAndAnswerButtons: UIColor = UIColor(named: "ColorOnAnswerAndPlayButtons")!
    var colorOnQuitButtons: UIColor = UIColor(named: "ColorOnQuitButtonsBlueTheme")!
    var backGroundColorTop: UIColor = UIColor(red: 169.0/255.0, green: 169.0/255.0, blue: 169.0/255.0, alpha: 1.0)
    var backGroundColorMiddle: UIColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    var backGroundColorBottom: UIColor = UIColor(red: 105.0/255.0, green: 105.0/255.0, blue: 105.0/255.0, alpha: 1.0)
}
