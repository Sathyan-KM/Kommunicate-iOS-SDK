//
//  ViewController.swift
//  Kommunicate
//
//  Created by mukeshthawani on 02/19/2018.
//  Copyright (c) 2018 mukeshthawani. All rights reserved.
//

#if os(iOS)
    import Kommunicate
    import UIKit
import KommunicateCore_iOS_SDK
import KommunicateChatUI_iOS_SDK

class ViewController: UIViewController, ALKCustomEventCallback {
    func messageSent(message: ALMessage) {
        
    }
    
    func messageReceived(message: ALMessage) {
        
    }
    
    func conversationRestarted(conversationId: String) {
        
    }
    
    func onBackButtonClick(isConversationOpened: Bool) {
        
    }
    
    func faqClicked(url: String) {
        
    }
    
    func conversationCreated(conversationId: String) {
        
    }
    
    func ratingSubmitted(conversationId: String, rating: Int, comment: String) {
        
    }
    
    func richMessageClicked(conversationId: String, action: Any, type: String) {
        print("pakka101 \(conversationId) action: \(action) type: \(type)")

    }
    
    func conversationInfoClicked() {
        print("pakka101")
    }
    
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)

        override func viewDidLoad() {
            super.viewDidLoad()
            activityIndicator.center = CGPoint(x: view.bounds.size.width / 2,
                                               y: view.bounds.size.height / 2)
            view.addSubview(activityIndicator)
            view.bringSubviewToFront(activityIndicator)
        }

        @IBAction func launchConversation(_: Any) {
//            activityIndicator.startAnimating()
//            view.isUserInteractionEnabled = false
//
//            Kommunicate.createAndShowConversation(from: self, completion: {
//                error in
//                self.activityIndicator.stopAnimating()
//                self.view.isUserInteractionEnabled = true
//                if error != nil {
//                    print("Error while launching")
//                }
//            })
            let event: [CustomEvent] = [.richMessageClick, .faqClick, .messageSend, .messageReceive]
            Kommunicate.subscribeCustomEvents(events: event, callback: self)
//            let kmConversation = KMConversationBuilder()
//
//                // Using BotIds parameter the bots can be added to the conversations
//                .withBotIds(["test-s8jmv"])
//
//                // To set the conversation assignee, pass AgentId or BotId.
//                .withConversationAssignee("test-s8jmv")
//
//                .useLastConversation(false)
//
//                .build()
//
//            Kommunicate.createConversation(conversation: kmConversation) { result in
//                switch result {
//                case .success(let conversationId):
//                    print("Conversation id: ",conversationId)
//                    Kommunicate.showConversationWith(
//                        groupId: conversationId,
//                        from: self,
//                        showListOnBack: false, // If true, then the conversation list will be shown on tap of the back button.
//                        completionHandler: { success in
//                        print("conversation was shown")
//                    })
//                // Launch conversation
//                case .failure(let kmConversationError):
//                    print("Failed to create a conversation: ", kmConversationError)
//                }
//            }
            Kommunicate.showConversations(from: self)
        }

        @IBAction func logoutAction(_: Any) {
            Kommunicate.logoutUser { result in
                switch result {
                case .success:
                    print("Logout success")
                    self.dismiss(animated: true, completion: nil)
                case .failure:
                    print("Logout failure, now registering remote notifications(if not registered)")
                    if !UIApplication.shared.isRegisteredForRemoteNotifications {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { granted, _ in
                            if granted {
                                DispatchQueue.main.async {
                                    UIApplication.shared.registerForRemoteNotifications()
                                }
                            }
                            DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)
                            }
                        }
                    } else {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
#endif
