//
//  ProfileInRadarView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import Foundation
import SwiftUI

struct ProfileInRadarView: View {
    @State private var rotationDegree = Angle.zero
    let radarResourceName: String
    let imageResourceName: String
    let fandomImageName: String
    let radarState: RadarState
    var body: some View {
        ZStack {
            
            // 레이더 애니메이션
            Image(radarResourceName)
                .rotationEffect(rotationDegree)
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                        rotationDegree = Angle(degrees: -360.0)
                    }
                }
                .opacity(radarState == .active ? 1.0 : 0.0)
            
            // 프로필 이미지 뷰
            Image("rader_frame")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .offset(y:5)
                .overlay(alignment: .center) {
                    Image(imageResourceName)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 60, height: 60)
                }
                .overlay(alignment: .bottomTrailing) {
                    Image(fandomImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }

        }
    }
}

struct ProfileInRadarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInRadarView(
            radarResourceName: "myRadar",
            imageResourceName: "sample_profile1",
            fandomImageName: "fandom",
            radarState: .active
        )

    }
}
