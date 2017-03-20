//
//  MasaController.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {
    var pizzaSesion : pizza = pizza()
    let masaList : [(String , String)] = [("Delgada","Delgada"),("Crujiente","Crujiente"),("Gruesa","Gruesa")]

    @IBOutlet var cboMasa: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! pizza
        pizzaSesion = c
             pizzaSesion.agregaMasa(idMasa: 1, masaNueva: "Delgada")
        // Configure interface objects here.
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let cboItems : [WKPickerItem] = masaList.map {
            let cboItem = WKPickerItem()
            cboItem.title =  $0.0
            cboItem.caption = $0.1
            return cboItem
        }
        cboMasa.setItems(cboItems)

   
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seguir() {
        
        pushController(withName: "pizzaValorQ", context: pizzaSesion)
    }
    
    @IBAction func seleccionaMasa(_ value: Int) {
        
        let  masaSeleccionado = masaList[value].1
        
        pizzaSesion.agregaMasa(idMasa: value, masaNueva: masaSeleccionado)
    }
    
}
