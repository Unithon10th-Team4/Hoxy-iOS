//
//  MessageArchiveViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import Foundation

class MessageArchiveViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        
    }
    
    func fetchRecievedMessages() {
//    https://211e-2001-2d8-f1a2-5f9a-f4bb-2a2a-3711-91a0.ngrok-free.app/messages?memberName=test
    }
}
