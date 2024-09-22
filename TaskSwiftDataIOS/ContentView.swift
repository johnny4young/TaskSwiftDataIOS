//
//  ContentView.swift
//  TaskSwiftDataIOS
//
//  Created by Johnny Young on 17/09/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var tareas: [Tareas]
    @State private var showAdd = false
    
    var body: some View{
        NavigationStack {
            VStack{
                if tareas.isEmpty {
                                ContentUnavailableView("No hay tareas", systemImage: "list.bullet.clipboard", description: Text("Aún no existen tareas en la app. por favor pulse en el + arriba a la derecha para crear una nueva tarea"))
                    Spacer()
                            } else {
                                main
                            }
            }.navigationTitle("Tareas")
                .toolbar {
                    ToolbarItem(placement: .primaryAction){
                        Button {
                            showAdd.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
        .fullScreenCover(isPresented : $showAdd){
            NewTareaView()
        }
        
        
    }
    
    
    var main: some View {
        List {
            ForEach(tareas) { tarea in
                TareaRow(tarea: tarea)
            }.onDelete{ index in
                if let v = index.first{
                    context.delete(tareas[v])
                }
                
            }
        }
    
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}

