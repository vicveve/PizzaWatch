//
//  pizza.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit

class pizza: NSObject {
    
    var tamanio : itemPizza = itemPizza(v: 0,d: "")
    var masa : itemPizza = itemPizza(v: 0,d: "")
    var queso : itemPizza = itemPizza(v: 0,d: "")
    var ingredientes : [String] = []
    
   
    
    func agregaTamanio( idTamanio : Int , tamanioNuevo : String){
        tamanio.setElemento(v: idTamanio, d: tamanioNuevo)
    }
    
    func agregaMasa( idMasa : Int , masaNueva : String){
        masa.setElemento(v: idMasa, d: masaNueva)
    }
    
    func agregaQueso( idQueso : Int , quesoNuevo : String){
        queso.setElemento(v: idQueso, d: quesoNuevo)
    }
    
    func agregaIngrediente(ingredienteNuevo : String) -> Bool {
        
        if(ingredientes.count==5){
            
            return false
        }
        
        let indexItem = ingredientes.index(of: ingredienteNuevo)
        
        if(indexItem == nil){
            ingredientes.append(ingredienteNuevo)
        }
        
        return true
        
    }
    
    func elminaIngrediente(ingredienteDelete : String){
        let indexItem = ingredientes.index(of: ingredienteDelete)
        
        if(indexItem != nil){
            ingredientes.remove(at: indexItem!)
        }
    }
    
    func getNumIngredientes() -> Int {
        return ingredientes.count
    }
    
    func obtienePiza() -> String {
        var pedido : String
        pedido=""
        pedido.append("Tu orden es el siguiente: \n\t")
        pedido.append("Tamaño:-> \(tamanio.descripcion)\n\t")
        pedido.append("Masa:---> \(masa.descripcion)\n\t")
        pedido.append("Queso:--> \(queso.descripcion)\n\t")
        pedido.append("Ingrediente(s):\n\t")
        for ing in ingredientes{
            pedido.append(" **\(ing)\n\t")
        }
        pedido.append("")
        pedido.append("Disfrute su pizza. 🍕 ☺️")
        
        
        return pedido
        
    }
    
    func eliminaLista(){
        ingredientes = []
    }


}

class itemPizza: NSObject {
    var descripcion : String = ""
    var valor : Int = 0
    
    init(v : Int, d : String) {
        descripcion = d
        valor = v
    }
    
    func setElemento(v : Int, d : String){
        descripcion = d
        valor = v
    }
}
