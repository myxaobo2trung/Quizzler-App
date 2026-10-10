//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Macpro on 6/10/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
