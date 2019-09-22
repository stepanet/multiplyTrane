//
//  ViewController.swift
//  MultiplyTraine
//
//  Created by Денис Сидоренко on 20/09/2019.
//  Copyright © 2019 Денис Сидоренко + Jack Sp@rrow. All rights reserved.
//

import UIKit

@IBDesignable
class ViewController: UIViewController {

    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var resultNumberLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var correctAnswerCountLabel: UILabel!
    @IBOutlet weak var incorrectAnswerCountLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var checkResultBtn: UIButton! {
        didSet {
            checkResultBtn.layer.borderWidth = 1
            checkResultBtn.layer.borderColor = #colorLiteral(red: 0.1591749489, green: 0.5741589665, blue: 0.9122018218, alpha: 1)
            checkResultBtn.layer.cornerRadius = 8
            checkResultBtn.layer.masksToBounds = true
        }
    }
    
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var resultNumber: Int = 0
    
    var correctCount: Int = 0 {
        didSet {
            correctAnswerCountLabel.text = "\(correctCount)"
        }
    }
    
    var incorrectCount: Int = 0 {
        didSet {
            incorrectAnswerCountLabel.text = "\(incorrectCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateNumbers()
        updateOperandsLabels()
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.cyan.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0, 0.4]
        
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func checkoutResult(_ sender: UIButton) {
        guard let resultText = answerTextField.text,
            let userNumber = Int(resultText) else { return }
        if userNumber == resultNumber {
            correctCount += 1
        } else {
            incorrectCount += 1
        }
        
        configurateNumbers()
        updateOperandsLabels()
    
        answerTextField.text = ""
    }
    
    func randomGerenate() -> Int {
        return Int.random(in: 1...9)
    }
    
    func configurateNumbers() {
        firstNumber = randomGerenate()
        secondNumber = randomGerenate()
        resultNumber = firstNumber * secondNumber
    }
    
    func updateOperandsLabels() {
        firstNumberLabel.text = "\(firstNumber)"
        secondNumberLabel.text = "\(secondNumber)"
    }
    
    func updateResultLabel() {
        resultNumberLabel.text = "\(resultNumber)"
    }
}

