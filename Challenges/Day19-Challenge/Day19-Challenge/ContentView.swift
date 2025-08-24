//
//  ContentView.swift
//  Conversion
//
//  Created by Lucky on 22/08/25.
//

import SwiftUI

enum Metrics: CaseIterable, Identifiable {
    var id: Self { self }
    
    case M, KM, Feet, Yards, Miles
    
    var toMeters: Double {
        switch self {
        case .M: return 1
        case .KM: return 1000
        case .Feet: return 0.3048
        case .Yards: return 0.9144
        case .Miles: return 1609.34
        }
    }
}

struct ContentView: View {
    
    @State private var inputLength: Double = 0.0
    @State private var inputMetrics = Metrics.M
    @State private var outputMetrics = Metrics.M
    
    private var convertedLength: Double {
        inputLength * inputMetrics.toMeters / outputMetrics.toMeters
    }
    
    var body: some View {
        Form {
            Section("Input Length") {
                TextField("", value: $inputLength, format: .number)
                
                Picker("", selection: $inputMetrics) { 
                    ForEach(Metrics.allCases) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Convert to") {
                Picker("", selection: $outputMetrics) { 
                    ForEach(Metrics.allCases) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Converted Length") {
                Text("\(convertedLength.formatted())")
            }
        }
    }
}

#Preview {
    ContentView()
}
