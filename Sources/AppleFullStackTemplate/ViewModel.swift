import SwiftUI
import Observation

@Observable
final class AppViewModel {
    var searchText = ""
    var isLoading = false
    var errorMessage: String?
    
    func performAction() async {
        isLoading = true
        defer { isLoading = false }
        
        try? await Task.sleep(for: .seconds(1))
        // Action logic
    }
}
