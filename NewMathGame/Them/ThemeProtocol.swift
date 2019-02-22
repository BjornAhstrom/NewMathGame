//
//  ThemeProtocol.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-10.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var fontForLabels: String { get }
    var fontForButtons: String { get }
    var colorForButtons: UIColor { get }
    var imagesForNumPadButtons: UIImage { get }
    var colorForStartPlayAndAnswerButtons: UIColor { get }
    var colorForQuitButtons: UIColor { get }
    var backGroundColorTop: UIColor { get }
    var backGroundColorMiddle: UIColor { get }
    var backGroundColorBottom: UIColor { get }
    var textColor: UIColor { get }
}
