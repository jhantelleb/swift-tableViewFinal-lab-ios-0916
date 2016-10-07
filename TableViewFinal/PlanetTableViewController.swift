//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    var planetCellIdentifier: String = "PlanetCell"
    var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    func generatePlanetInfo() {
        planets.append(Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."] ))
        planets.append(Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."] ))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var moonText = ""
        let daysText = " days (full orbit)"
        let factsText = " facts"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier , for: indexPath ) as! PlanetTableViewCell
        let index = indexPath.row
        
        if planets[index].numberOfMoons == 1 {
           moonText = " Moon"
        } else {
           moonText = " Moons"
        }
        
        
        
        cell.planetNameLabel?.text = planets[index].name
        cell.numberOfMoonsLabel?.text =
            String(describing: planets[index].numberOfMoons) + moonText
        cell.numberOfDaysFullOrbitLabel?.text =
            String(planets[index].fullOrbit) + daysText
        cell.numberOfFacts?.text =
            String(describing: planets[index].facts.count) + factsText
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let factTableView = segue.destination as! FactTableViewController
        let indexRow = self.tableView.indexPathForSelectedRow?.row
        
        factTableView.planet = planets[indexRow!]
    }
}
