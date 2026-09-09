struct MyQuestionAnswerer {
    func responseTo(question: String) -> String {
        let lowerQuestion = question.lowercased()
        
        if lowerQuestion == "hello there" {
            return "Why, hello there!"
        } else if lowerQuestion == "where are the cookies?" {
            return "In the cookie jar!"
        } else if lowerQuestion.hasPrefix("where") {
            return "To the north!"
        } else if lowerQuestion.hasPrefix("can") {
            return Int.random(in: 0...1) == 0 ? "You can!" : "Absolutely not!"
        } else if lowerQuestion.hasPrefix("should") {
            return "Do what you think is right."
        } else {
            let defaultNumber = question.count % 4
            
            if defaultNumber == 0 {
                return "Well that entirely depends."
            } else if defaultNumber == 1 {
                return "I think you should, and it will work."
            } else if defaultNumber == 2 {
                return "Well, that sounds plausible. But I'm not sure."
            } else {
                return "You can do it!"
            }
        }
    }
}
