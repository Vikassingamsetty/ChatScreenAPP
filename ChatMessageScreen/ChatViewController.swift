//
//  MessagesViewController.swift
//  ChatMessageScreen
//
//  Created by Appcare Apple on 30/08/20.
//  Copyright © 2020 Appcare Apple. All rights reserved.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}


class ChatViewController: MessagesViewController, MessagesLayoutDelegate, MessagesDisplayDelegate, MessagesDataSource {
    
    let currentUser = Sender(senderId: "First", displayName: "Legendary Action")
    let endUser = Sender(senderId: "Second", displayName: "Bring The Action")
    
    var message = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()

        message.append(Message(sender: currentUser, messageId: "1", sentDate: Date().addingTimeInterval(-86100), kind: .text("Hi")))
        message.append(Message(sender: endUser, messageId: "2", sentDate: Date().addingTimeInterval(-70000), kind: .text("Hello")))
        message.append(Message(sender: currentUser, messageId: "3", sentDate: Date().addingTimeInterval(-60000), kind: .text("How are you?")))
        message.append(Message(sender: endUser, messageId: "4", sentDate: Date().addingTimeInterval(-50000), kind: .text("I am doing good and glad to talk to you after such a long time. Its really means a lot to me for this conversation!")))
        message.append(Message(sender: currentUser, messageId: "5", sentDate: Date().addingTimeInterval(-40000), kind: .text("Ho thats really great!! sounds good for the information!!!.")))
        message.append(Message(sender: endUser, messageId: "6", sentDate: Date().addingTimeInterval(-20000), kind: .text("Hoo!! really..")))
        message.append(Message(sender: currentUser, messageId: "7", sentDate: Date().addingTimeInterval(-10000), kind: .text("Let hang up this weekend at some place!! will call you regarding it soon....Thank you")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
}
