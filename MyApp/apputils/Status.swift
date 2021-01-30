//
//  Status.swift
//  MyApp
//
//  Created by Зехниддин on 30/01/21.
//

import Foundation
import Combine

class Status: ObservableObject {
    var didChange = PassthroughSubject<Status, Never>()
    @Published var temp: String? { didSet { self.didChange.send(self) } }
    
    func listen() {
        if let userid = UserDefaults.standard.string(forKey: "key") {
            self.temp = userid
        } else {
            self.temp = nil
        }
    }
}
