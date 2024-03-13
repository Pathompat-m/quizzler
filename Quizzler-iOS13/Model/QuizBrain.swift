import Foundation

// Struct to manage the quiz logic
struct QuizBrain {
    // Array containing all the questions in the quiz
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0 // Index of the current question
    var score = 0 // User's score
    
    // Method to check the user's answer and update the score
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1 // Increment score if the answer is correct
            return true
        } else {
            return false
        }
    }
    
    // Method to get the user's score
    func getScore() -> Int {
        return score
    }
    
    // Method to get the text of the current question
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // Method to calculate and return the progress of the quiz
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    // Method to move to the next question
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1 // Move to the next question
        } else {
            // If all questions have been asked, reset the quiz
            questionNumber = 0
            score = 0
        }
    }
    
}
