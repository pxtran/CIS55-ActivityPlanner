//
//  CalendarViewControllerCollectionViewController.swift
//  ActivityPlanner
//
//  Created by Peter Tran on 3/4/15.
//  Copyright (c) 2015 DeAnza. All rights reserved.
//

import UIKit

let reuseIdentifier = "calendarCell"

class CalendarViewControllerCollectionViewController: UICollectionViewController {

    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(CalanderCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let flowLayout = self.collectionView?.collectionViewLayout as UICollectionViewFlowLayout
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 23)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 8 * 25
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CalanderCollectionViewCell

        // Configure the cell

        //cell.cellText.font = UIFont(name: "System", size: 6.0)

        let index = indexPath.row

        if index == 0 {
            cell.layer.borderWidth = 0
            cell.cellText.text = ""
        }

        else if index >= 1 && index <= 7{
            //cell.layer.borderColor = UIColor.whiteColor().CGColor
            cell.layer.borderWidth = 0
            cell.cellText.text = days[index - 1]
        }

        else if index % 8 == 0  && index != 0{
            //cell.layer.borderColor = UIColor.whiteColor().CGColor
            cell.layer.borderWidth = 0

            if index == 8 {
                cell.cellText.text = "12:00 AM"
            } else if index == 104 {
                cell.cellText.text = "12:00 PM"
            } else if index < 100 {
                cell.cellText.text = String((index / 8) - 1) + ":00 AM"
            } else {
                cell.cellText.text = String(((index / 8) - 1) % 12) + ":00 PM"
            }
        }

        else {
            //cell.backgroundColor = UIColor.blueColor()
            cell.layer.borderColor = UIColor.blackColor().CGColor
            cell.layer.borderWidth = 1.0
            cell.cellText.numberOfLines = 0
            cell.cellText.textColor = UIColor.blackColor()
            cell.cellText.text = "Event 1\nEvent 2\nEvent 3"
        }

        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)

        let index = indexPath.row

        if (index >= 0 && index <= 7) || index % 8 == 0 {
            cell?.layer.backgroundColor = UIColor.whiteColor().CGColor
        } else {
            cell?.layer.backgroundColor = UIColor.grayColor().CGColor
        }
    }

    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell?.layer.backgroundColor = UIColor.whiteColor().CGColor
    }

    /*func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
    }

    func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }

    func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
    }*/

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
