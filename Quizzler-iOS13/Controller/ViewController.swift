import UIKit

// View controller class to manage the user interface
class ViewController: UIViewController {
    // Outlets for UI elements
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Instance of QuizBrain to manage the quiz logic
    var quizBrain = QuizBrain()
    
    // Method called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI() // Initialize the UI
    }

    // Method called when the user selects an answer
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // Get the selected answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer) // Check if the answer is correct
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green // Change button color to green for correct answer
        } else {
            sender.backgroundColor = UIColor.red // Change button color to red for incorrect answer
        }

        quizBrain.nextQuestion() // Move to the next question
        
        // Delay UI update for visual feedback
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    // Method to update the UI
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText() // Update question text
        progressBar.progress = quizBrain.getProgress() // Update progress bar
        scoreLabel.text = "Score: \(quizBrain.getScore())" // Update score label
        trueButton.backgroundColor = UIColor.clear // Reset button colors
        falseButton.backgroundColor = UIColor.clear
    }
        
}


