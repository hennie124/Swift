//
//  TableViewController.swift
//  Quiz_Kanna_02
//
//  Created by 임현진 on 2021/07/26.
//

import UIKit
import Kanna

class TableViewController: UITableViewController {
    var items : Array<String> = []
    var lank : Array<Int> = []
    var url : Array<String> = []
    @IBOutlet var tvTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        dataCrawling()
    }
    
    func dataCrawling(){
        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainUrl) else {
            print("Error:\(mainUrl) doesn't seem to be a valid URL")
            return
        }
        do{
           //mainUrl에서 String형으로 변환하고 HTML형으로 한번 더 변환한다.
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            var count = 1
            for title in doc.xpath(" //*[@id='top_movies_main']/div/table/tr/td/a"){
                items.append(title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                print(count,title["href"]!)
                url.append("https://www.rottentomatoes.com\(title["href"]!)")
                //print(count,title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                //trimming 해야 순서에 맞게 출력된다!
                lank.append(count)
                count += 1
            }
        }catch let error{
            print("Error: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       //section 갯수 지정
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //table list의 열 갯수를 지정한다.
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(lank[indexPath.row]) : "+items[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        //cell이 전체에서 한 칸
        let indexPath = self.tvTableView.indexPath(for: cell)
        //indexPath 는 전체에서 선택한 cell의 indexPath를 받아온다(indexPath --> 리스트의 순번)
        let detailView = segue.destination as! ViewController
        //detailView가 segue로 연결되어 indexPath에 대하여 정보를 넘긴다.
        detailView.receiveItem = (url[indexPath!.row])
        //dto와 비슷/ 다음 페이지에 있는 함수로 url을 넘김!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
