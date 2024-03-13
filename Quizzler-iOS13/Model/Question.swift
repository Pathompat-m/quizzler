import Foundation

// Struct to represent a single question
struct Question {
    let text: String // Question text
    let answer: String // Correct answer
    
    // Initializer to create a Question object
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}


