//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Ferico Samuel on 08/05/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {
    @IBOutlet weak var flightLabel: WKInterfaceLabel!
    @IBOutlet weak var routeLabel: WKInterfaceLabel!
    @IBOutlet weak var boardingLabel: WKInterfaceLabel!
    @IBOutlet weak var boardTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    @IBOutlet weak var gateLabel: WKInterfaceLabel!
    @IBOutlet weak var seatLabel: WKInterfaceLabel!
    
    var flight: Flight? {
        didSet {
            guard let flight = flight else { return }

            flightLabel.setText("Flight \(flight.shortNumber)")
            routeLabel.setText(flight.route)
            boardingLabel.setText("\(flight.number) Boards")
            boardTimeLabel.setText(flight.boardsAt)

            if flight.onSchedule {
                statusLabel.setText("On Time")
            } else {
                statusLabel.setText("Delayed")
                statusLabel.setTextColor(.red)
            }
            gateLabel.setText("Gate \(flight.gate)")
            seatLabel.setText("Seat \(flight.seat)")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let flight = context as? Flight {
          self.flight = flight
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
