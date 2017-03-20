//
//  QuesoController.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {

    var pizzaSesion : pizza = pizza()
     let quesoList : [(String , String)] = [("Mozarela","Mozarela"),("Cheddar","Cheddar"),("Parmesano","Parmesano"),("Sin queso","Sin queso")]
    
    @IBOutlet var cboQueso: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! pizza
        pizzaSesion = c
        pizzaSesion.agregaQueso(idQueso: 1, quesoNuevo: "Mozarela")

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let cboItems : [WKPickerItem] = quesoList.map {
            let cboItem = WKPickerItem()
            cboItem.title =  $0.0
            cboItem.caption = $0.1
            return cboItem
        }
        cboQueso.setItems(cboItems)
        
           }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seguir() {
        pushController(withName: "pizzaValorI", context: pizzaSesion)
    }
    
    @IBAction func seleccionaQueso(_ value: Int) {
        
        let quesoSeleccionado = quesoList[value].1
        
        pizzaSesion.agregaQueso(idQueso: value, quesoNuevo: quesoSeleccionado)
    
        
            
        }
}
