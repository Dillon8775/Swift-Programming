//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Dillon Strickland on 9/28/26.
//

import UIKit

enum Mode {
    case flashCard
    case quiz
}

enum State {
    case question
    case answer
}

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    
    var mode: Mode = .flashCard {
        didSet {
            updateUI()
        }
    }
    var state: State = .question
    
    // Quiz-specific only
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // Update the app's UI based on its mode and state
    func updateUI() {
        switch mode {
            case .flashCard: updateFlashCardUI()
            case .quiz: updateQuizUI()
        }
    }
    
    // Updates the app's UI in flash card mode
    func updateFlashCardUI() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
    }
    
    // Updates the app's UI in quiz mode
    func updateQuizUI() {
        switch state {
            case .question: answerLabel.text = ""
            case .answer: if answerIsCorrect {
                let correct: String = "Correct!"
                answerLabel.text = correct
                print(correct)
            } else {
                let incorrect: String = "Incorrect."
                answerLabel.text = incorrect
                print(incorrect)
            }
        }
    }
    
    // Runs after the user hits the Return key on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldContents = textField.text!
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }
        
        state = .answer
        updateUI()
        return true
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex == elementList.count {
            currentElementIndex = 0
        }
        state = .question
        
        updateUI()
    }
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .flashCard
        } else {
            mode = .quiz
        }
    }
}
