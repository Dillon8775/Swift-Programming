import Foundation
class ConversationDataSource {
    
    /// The number of Messages in the conversation
    var messages = [openingLine]
    var messageCount: Int {return messages.count}
    
    /// Add a new question to the conversation
    func add(question: String) {
        print("Asked to add question: \(question)")
        let question = Message(date: Date(), text: question, type: .question)
        messages.append(question)
    }
    
    /// Add a new answer to the conversation
    func add(answer: String) {
        print("Asked to add answer: \(answer)")
        let answer = Message(date: Date(), text: answer, type: .answer)
        messages.append(answer)
    }
    
    /// The Message at a specific point in the conversation
    func messageAt(index: Int) -> Message {
        print("Asking for message at index \(index)")
        return messages[index]
//        if index % 2 == 0 {
//            return Message(date: Date(), text: "Question \(index / 2)", type: .question)
//        } else {
//            return Message(date: Date(), text: "Asnswer \(index / 2)", type: .answer)
//        }
    }
}
