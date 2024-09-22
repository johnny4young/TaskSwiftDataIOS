//
//  DataModel.swift
//  TaskSwiftDataIOS
//
//  Created by Johnny Young on 17/09/24.
//

import Foundation
import SwiftData

enum EstadoTarea: String, Codable, CaseIterable, Identifiable {
    case pendiente = "Pendiente"
    case enProgreso = "En Progreso"
    case completada = "Completado"
    
    var id:Self { self}
}

@Model
final class Tareas {
    @Attribute(.unique) var id: UUID
    var nombre: String
    var descripcion: String
    var fecha: Date
    var estado: EstadoTarea
    
    init(id: UUID, nombre: String, descripcion: String, fecha: Date, estado: EstadoTarea) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.fecha = fecha
        self.estado = estado
    }
}
