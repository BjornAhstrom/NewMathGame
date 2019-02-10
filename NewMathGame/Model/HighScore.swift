//
//  HighScore.swift
//  NewMathGame
//
//  Created by Björn Åhström on 2019-02-05.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import Foundation
import UIKit

class HighScore {
    
    var highScore : [Person]
    
    init() {
        // read from user defaults
        // if null
        highScore = [Person]()
    }
    
    func add(person: Person) {
        highScore.append(person)
        
        //save to user defaults
    }
}

class Person {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
        
        //HighScore.add(Person("David", 30))
        
    }
    
}
