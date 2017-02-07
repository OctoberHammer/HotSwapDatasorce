//
//  InOutTableViewController.swift
//  inbOutb
//
//  Created by October Hammer on 2/7/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit


protocol IDProvider {
	var price: Int? {get set}
	var deepLink: String? {get set}
}

struct InboundID: IDProvider {
	var price: Int?
	var deepLink: String?
	var someSpecificProp: String?
}

struct OutboundID: IDProvider {
	var price: Int?
	var deepLink: String?
	var anotherSpecificProp: String?
}



class InOutTableViewController: UITableViewController {
	var outboundArray = [IDProvider]()
	var inboundArray = [IDProvider]()
	var showInBound = true {
		didSet {
			if showInBound {
				self.amountOfItems = self.inboundArray.count
			} else {
				self.amountOfItems = self.outboundArray.count
			}
		}
	}
	
	var amountOfItems: Int = 0 {
		didSet{
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let out1 = OutboundID(price:100, deepLink : "out First", anotherSpecificProp : "initially Outbound")
		let out2 = OutboundID(price:200, deepLink : "out Second", anotherSpecificProp : "initially Outbound")
		let out3 = OutboundID(price:300, deepLink : "out Third", anotherSpecificProp : "initially Outbound")
		let inb1 = InboundID(price:50, deepLink : "inb First", someSpecificProp : "initially Inbound")
		let inb2 = InboundID(price:60, deepLink : "inb Second", someSpecificProp : "initially Inbound")
		//Наши массивы
		outboundArray = [out1, out2, out3]
		inboundArray = [inb1, inb2]
		//сначала будем выводить Инбоунд
		amountOfItems = inboundArray.count
		
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amountOfItems
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemCell
		if showInBound {
			cell.lblPrice.text = "\(inboundArray[indexPath.row].price ?? 0)"
			cell.lblDeepLink.text = "\(inboundArray[indexPath.row].deepLink ?? "")"
		} else {
			cell.lblPrice.text = "\(outboundArray[indexPath.row].price ?? 0)"
			cell.lblDeepLink.text = "\(outboundArray[indexPath.row].deepLink ?? "")"
		}

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		showInBound = !showInBound
	}



}
