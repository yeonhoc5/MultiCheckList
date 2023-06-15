//
//  ViewModel.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/10.
//

import Foundation
import FirebaseRemoteConfig

@MainActor
class ViewModel: NSObject, ObservableObject {
    @Published var isShowingAlert: Bool = false
    @Published var title: String = ""
    @Published var message: String = "가나다라"
    
    let remoteConfig = RemoteConfig.remoteConfig()
    
    override init() {
        super.init()
        Task {
            try await startFetching()
        }
    }

    
    private func startFetching() async throws {
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.configSettings = setting
        remoteConfig.defaultValue(forKey: "RemoteConfigDefaults")
        
        do {
            let fetch = try await remoteConfig.fetchAndActivate()
            if fetch == .successFetchedFromRemote {
                displayWelcome()
//                return
            } 
            
        }
        
//        remoteConfig.fetch { (status, error) -> Void in
//            if status == .success {
//                print("Config fetched!")
//                self.remoteConfig.fetchAndActivate()
//            } else {
//                print("Config not fetched")
//                print("Error: \(error?.localizedDescription ?? "No error available.")")
//            }
//            self.displayWelcome()
//        }
            
        
    }
    
    private func displayWelcome() {
        DispatchQueue.main.async {
            self.title = self.remoteConfig["splash_title"].stringValue ?? "error"
            self.message = self.remoteConfig["splash_message"].stringValue ?? "error"
            self.isShowingAlert = self.remoteConfig["splash_message_caps"].boolValue

        }
    }
}
