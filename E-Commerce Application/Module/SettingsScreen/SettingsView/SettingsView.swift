//
//  SettingsView.swift
//  E-Commerce Application
//
//  Created by Nour Gweda on 6/1/22.
//  Copyright © 2022 iti. All rights reserved.
//
import Foundation
import SwiftUI


struct SettingsView : View{

    var body: some View{
        VStack{
            BannerViewSettings().padding(.bottom)
            SettingsBodyView().padding(.top)
            Spacer()
        }

        
    }
}




struct settings_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}






