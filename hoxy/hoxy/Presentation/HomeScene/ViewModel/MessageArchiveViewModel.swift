//
//  MessageArchiveViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import Foundation

class MessageArchiveViewModel: ObservableObject {
    @Published var messages = [MessageResponse]()
    
    init() {
        self.fetchRecievedMessages()
    }
}

extension MessageArchiveViewModel {
    func fetchRecievedMessages() {
        APIService.shared.receivedMessage { [weak self] messages in
            let messageList = messages.map {
                MessageResponse(sender: $0.sender, contents: $0.contents, timestamp: String($0.timestamp.split(separator: "T")[0]))
            }
            self?.messages = messageList
        }
    }
}
