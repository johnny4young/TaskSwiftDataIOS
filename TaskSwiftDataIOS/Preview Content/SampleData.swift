//
//  SampleData.swift
//  TaskSwiftDataIOS
//
//  Created by Johnny Young on 17/09/24.
//

import Foundation
import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([
            Tareas.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let tarea1 = Tareas(id: UUID(), nombre: "demo cuarto", descripcion: "es la primera demo prueba de cuarto", fecha: .now, estado: .enProgreso)
        let tarea2 = Tareas(id: UUID(), nombre: "subir a github", descripcion: "subirt el repo a un github", fecha: .now, estado: .pendiente)
        let tarea3 = Tareas(id: UUID(), nombre: "componer readme", descripcion: "editar el archivo Readme", fecha: .now, estado: .pendiente)
        
        container.mainContext.insert(tarea1)
        container.mainContext.insert(tarea2)
        container.mainContext.insert(tarea3)
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}


extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
