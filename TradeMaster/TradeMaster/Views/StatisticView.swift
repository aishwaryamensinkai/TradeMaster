//
//  StatisticView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import Foundation
import SwiftUI


struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.themes.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.accentColor)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.themes.green : Color.themes.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    StatisticView(stat: StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34))
}
