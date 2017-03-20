//
//  ConfirmaController.swift
//  PizzaWatch
//
//  Created by Victor Ernesto Velasco Esquivel on 14/03/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmaController: WKInterfaceController {

    var pizzaSesion : pizza = pizza()
    
    @IBOutlet var lblResumen: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let c = context as! pizza
        pizzaSesion = c
        
        lblResumen.setText(pizzaSesion.obtienePiza())
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

    @IBAction func confirmar() {
        
        pushController(withName: "pizzaValor", context: pizzaSesion)
    }
    
   /* func showPopup(){
        
        let h0 = { print("ok")}
        
        let action1 = WKAlertAction(title: "Approve", style: dest Default, handler:h0)
        let action2 = WKAlertAction(title: "Decline", style: .Destructive) {}
        let action3 = WKAlertAction(title: "Cancel", style: .Cancel) {}
        
        presentAlertControllerWithTitle("Voila", message: "", preferredStyle: .ActionSheet, actions: [action1, action2,action3])
        
        
    }*/

}
