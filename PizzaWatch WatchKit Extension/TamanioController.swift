//
//  TamanioController.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit
import Foundation


class TamanioController: WKInterfaceController {
    var pizzaSesion : pizza = pizza()
    let tamanioList : [(String , String)] = [("Chica","Chica"),("Mediana","Mediana"),("Grande","Grande")]
    
    @IBOutlet var cboTamanio: WKInterfacePicker!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        pizzaSesion.agregaTamanio(idTamanio: 1, tamanioNuevo: "Chica")
      
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let cboItems : [WKPickerItem] = tamanioList.map {
            let cboItem = WKPickerItem()
            cboItem.title =  $0.0
            cboItem.caption = $0.1
            return cboItem
        }
        cboTamanio.setItems(cboItems)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seguir() {
        
        
        pushController(withName: "pizzaValorM", context: pizzaSesion)
    }
    @IBAction func seleccionaPizza(_ value: Int) {
        
        let tamanioSeleccionado = tamanioList[value].1
        
        pizzaSesion.agregaTamanio(idTamanio: value, tamanioNuevo: tamanioSeleccionado)
    }
    
    
}
