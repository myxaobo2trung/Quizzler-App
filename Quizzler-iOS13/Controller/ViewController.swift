//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var answerText1: UIButton!
    @IBOutlet weak var answerText2: UIButton!
    @IBOutlet weak var answerText3: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let currentTag = sender.tag
        var answerText = ""
        switch currentTag{
        case 0:
            answerText = quizBrain.getAnswerText()[0]
        case 1:
            answerText = quizBrain.getAnswerText()[1]
        case 2:
            answerText = quizBrain.getAnswerText()[2]
        default:
            print("none")
        }
        let userAnswer = answerText
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer)
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
       
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        answerText1.setTitle(quizBrain.getAnswerText()[0], for: .normal)
        answerText2.setTitle(quizBrain.getAnswerText()[1], for: .normal)
        answerText3.setTitle(quizBrain.getAnswerText()[2], for: .normal)
        answerText1.backgroundColor = UIColor.clear
        answerText2.backgroundColor = UIColor.clear
        answerText3.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
    
}

