//
//  IngredientesController.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {

    var pizzaSesion : pizza = pizza()
    
    @IBOutlet var chkjamon: WKInterfaceSwitch!
    @IBOutlet var chkpepperoni: WKInterfaceSwitch!
    @IBOutlet var chkPavo: WKInterfaceSwitch!
    @IBOutlet var chkSalchicha: WKInterfaceSwitch!
    @IBOutlet var chkAceituna: WKInterfaceSwitch!
    @IBOutlet var chkCebolla: WKInterfaceSwitch!
    @IBOutlet var chkPimiento: WKInterfaceSwitch!
    @IBOutlet var chpPina: WKInterfaceSwitch!
    @IBOutlet var chkAnchoa: WKInterfaceSwitch!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! pizza
        pizzaSesion = c
        pizzaSesion.eliminaLista()
        // Configure interface objects here.
    }


    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func seguir() {
        
        let contador = pizzaSesion.getNumIngredientes()
        
        if(contador==0){
            showPopup(mensaje: "Seleccina por lo menos un ingrediente ingrediente")
            return
        }
        
        pushController(withName: "pizzaValorConf", context: pizzaSesion)
    }
    
    func showPopup( mensaje : String){
     
     let h0 = { print("ok")}
     
     let action1 = WKAlertAction(title: "Cerrar", style:  WKAlertActionStyle.default, handler:h0)
   /*  let action2 = WKAlertAction(title: "Decline", style: WKAlertActionStyle.destructive) {}
     let action3 = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.cancel) {}
     */
        presentAlert(withTitle: "Revisa tu orden", message: mensaje, preferredStyle: WKAlertControllerStyle.actionSheet, actions: [action1])
     
     
     
     }

    
    @IBAction func seleccionaAnchoa(_ value: Bool) {
        
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Anchoa")
            if(!bAgregado)
            {
                chpPina.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Anchoa")
        }

        
    }
    
    @IBAction func seleccionaPina(_ value: Bool) {
        
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Piña")
            if(!bAgregado)
            {
                chpPina.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Piña")
        }
        
    }
    @IBAction func seleccionaPimiento(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Pimiento")
            if(!bAgregado)
            {
                chkPimiento.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Pimiento")
        }

    }
    
    @IBAction func seleccionaCebolla(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Cebolla")
            if(!bAgregado)
            {
                chkCebolla.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Cebolla")
        }
    }
    
    @IBAction func seleccionaAceituna(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Aceituna")
            if(!bAgregado)
            {
                chkAceituna.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Aceituna")
        }

    }
    
    @IBAction func seleccionaSalchicha(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Salchicha")
            if(!bAgregado)
            {
                chkSalchicha.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Salchicha")
        }
    }
    
    @IBAction func seleccionaPavo(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Pavo")
            if(!bAgregado)
            {
                chkPavo.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Pavo")
        }
    }
    @IBAction func seleccionaPepperoni(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Pepperoni")
            if(!bAgregado)
            {
                chkpepperoni.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Pepperoni")
        }
    }
    
    @IBAction func seleccionaJamon(_ value: Bool) {
        var bAgregado : Bool = true
        
        if(value){
            bAgregado = pizzaSesion.agregaIngrediente(ingredienteNuevo: "Jamón")
            if(!bAgregado)
            {
                chkjamon.setOn(false)
            }
        }
        else{
            pizzaSesion.elminaIngrediente(ingredienteDelete: "Jamón")
        }

    }
}
