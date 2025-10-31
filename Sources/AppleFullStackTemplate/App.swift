import SwiftUI
import SwiftData

@main
struct FullStackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Item.self, User.self])
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [Item]
    @State private var viewModel = AppViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    ItemRow(item: item)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Full Stack")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    addItem()
                }
            }
        }
    }
    
    private func addItem() {
        let item = Item(name: "Item \(items.count + 1)")
        context.insert(item)
    }
    
    private func delete(_ indexSet: IndexSet) {
        for index in indexSet {
            context.delete(items[index])
        }
    }
}

struct ItemRow: View {
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundStyle(.blue)
            Text(item.name)
        }
    }
}
