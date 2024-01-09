//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Roberto Manese III on 1/4/24.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var isPresentingEditScrumView: Bool
    @Binding var scrum: DailyScrum

    var date = Date()

    var body: some View {
        NavigationStack {
            CreateEditScrumView(scrum: $scrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditScrumView = false
                        }
                    }
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditScrumSheet(isPresentingEditScrumView: .constant(true), scrum: .constant(DailyScrum.sampleData[0]))
    }
}
