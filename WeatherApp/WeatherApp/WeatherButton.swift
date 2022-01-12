//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Stitch on 3/2/21.
//

import SwiftUI

struct weatherButton: View {
    var title: String
    var textColor: Color
    var BackgroundColor: Color
    
    var body: some View {
        Text(title)
                .frame(width: 280, height: 50)
                .background(BackgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 22, weight: .bold, design: .default))
                .cornerRadius(20)
    }
}
