//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Roberto Manese III on 1/4/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.getEmptyScrum()

    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    var body: some View {
        NavigationStack {
            CreateEditScrumView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
