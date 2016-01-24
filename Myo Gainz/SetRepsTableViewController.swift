//
//  SetRepsTableViewController.swift
//  Myo Gainz
//
//  Created by Matthew Dias on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class SetRepsTableViewController: UITableViewController {
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    var workouts : [String]?
    var workoutType : ExerciseType?
    
    enum ExerciseType : String {
        case Shoulders = "Shoulders"
        case Chest = "Chest"
        case Back = "Back"
        case Biceps = "Biceps"
        case Triceps = "Triceps"
        case Legs = "Legs"
    }
    
    func setExerciseType(type : ExerciseType) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        workouts = ["Shoulder Press", "Shrugs", "Lateral Raises", "Front Raises",  "Upright Rows"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (workouts?.count)!
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SetRepsTableViewCell {
        let repCell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath)
        repCell.numberOfSets? = "0"
        repCell.exerciseName? = workouts![indexPath.row]
        return repCell
    }

}
