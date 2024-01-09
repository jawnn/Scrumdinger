//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Roberto Manese III on 1/4/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    let theme: Theme

    var secondsElapsed: Int
    var secondsRemaining: Int

    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }

    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }

    private var minutesRemaining: Int {
        secondsRemaining / 60
    }

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                        .labelStyle(.trailingIcon)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(
            theme: .sky,
            secondsElapsed: 60,
            secondsRemaining: 180
        )
            .previewLayout(.sizeThatFits)
    }
}
