//
//  StarterScreen.swift
//  MyApp
//
//  Created by Зехниддин on 30/01/21.
//

import SwiftUI

struct StarterScreen: View {
    @EnvironmentObject var status: Status
    
    var body: some View {
        VStack {
            if self.status.temp != nil {
                HomeScreen()
            } else {
                LogInScreen()
            }
        }
        .onAppear {
            status.listen()
        }
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterScreen()
    }
}
