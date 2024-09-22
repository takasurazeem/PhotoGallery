//  /*
//
//  Project: PhotoGallery
//  File: TabBarView.swift
//  Created by: Elaidzha Shchukin
//  Date: 17.09.2024
//
//  */

import SwiftUI

struct TabBarView: View {
    @State var progress: CGFloat = 0.4
    @State var selectedItem: TabIcon = .Home
    @State var xOffset: CGFloat = 3 * 70.0
    
    var body: some View {
        HStack {
            ForEach(sidebars) { item in
                Spacer()
                Image(systemName: item.icon)
                    .foregroundStyle(.black)
                    .onTapGesture {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                selectedItem = item.tab
                                xOffset = CGFloat(item.index) * 70.0
                            }
                        }
                        withAnimation {
                            progress = 0.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                            withAnimation {
                                progress = 0.5
                            }
                        }
                    }
                Spacer()
            }
            .font(.system(size: 16, weight: .semibold))
            .frame(width: 23, height: 23)
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 47.5)
        .frame(height: 70)
        .background(.ultraThickMaterial)
        .cornerRadius(30)
        .overlay(alignment: .topLeading) {
            CustomCircleA(circleA: $progress)
                .offset(x: 16.5, y: 17)
                .offset(x: xOffset)
        }
    }
}

#Preview {
    TabBarView()
}
