//
//  PaymentScreens.swift
//  E-Commerce Application
//
//  Created by Aya Abdelraouf on 5/31/22.
//  Copyright © 2022 iti. All rights reserved.
//

import SwiftUI
import StepperView


struct StepsV: View {
    var steps : [Text]
    
    
    var indicationTypes : [StepperIndicationType<NumberedCircleView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicationTypes)
            .stepIndicatorMode(StepperMode.horizontal)
            .spacing(30)
        .lineOptions(StepperLineOptions.custom(1, Colors.blue(.teal).rawValue))    }
}

struct StepsC: View {
    var steps : [TextView]
    
    var indicators :[StepperIndicationType<AnyView>]
    
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicators)
            .stepIndicatorMode(StepperMode.horizontal)
            .lineOptions(StepperLineOptions.rounded(4, 8, Color.black))
            .stepLifeCycles([StepLifeCycle.completed, .completed, .completed, .pending])
        .spacing(50)}
}



