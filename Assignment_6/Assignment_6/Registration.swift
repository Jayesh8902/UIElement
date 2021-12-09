import UIKit

class Registration: UIViewController {
    
    private let lbluname : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Full Name"
        return lbl
    }()
    private let txtuname : UITextField = {
        let txt = UITextField()
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        return txt
    }()
    
    private let lbldob : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Date Of Birth"
        return lbl
    }()
    private let dob : UIDatePicker = {
        let db = UIDatePicker()
        db.timeZone = NSTimeZone.local
        db.backgroundColor = UIColor.white
        db.datePickerMode = UIDatePicker.Mode.date
        return db
    }()
    private let mysegment : UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "MALE", at: 1, animated: false)
        sg.insertSegment(withTitle: "FEMALE", at: 2, animated: false)
        sg.insertSegment(withTitle: "OTHER", at: 3, animated: false)
        sg.selectedSegmentIndex = 1
        return sg
    }()
   
    
    private let PageControl : UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 3
        pg.backgroundColor = UIColor.blue
        pg.currentPage = 0
        pg.tintColor = UIColor.blue
        pg.addTarget(self, action: #selector(onPageChange), for: .valueChanged)
        return pg
    }()
    
    @objc public func onPageChange()
    {
        print(PageControl.currentPage)
    }
    private let lblsal : UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Salary"
        return lbl
    }()
    private let myslidersal:UISlider = {
        let slider=UISlider()
        slider.minimumValue=0
        slider.maximumValue=100000
        slider.addTarget(self, action: #selector(handleslider), for: .valueChanged)
        return slider
        
    }()
    private let lblsalval : UILabel = {
        let lbl = UILabel()
        lbl.text = "00"
        return lbl
    }()
    @objc func handleslider()
    {
        // print(myslidersal.value)
        var val : Float = 0.0;
        val = myslidersal.value
        lblsalval.text = String(round(val))
    }
    
    
    private let lblsteper : UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Working Days"
        return lbl
    }()
    
    private let myateper : UIStepper = {
        let st = UIStepper()
    //    st.autorepeat = true
       // st.isContinuous = true
        st.addTarget(self, action: #selector(handlestep), for: .valueChanged)
       
        st.minimumValue = 1
         st.maximumValue = 7
        return st
    }()
    private let lblsteperval : UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        return lbl
    }()
    
    @objc public func handlestep()
    {
        lblsteperval.text = myateper.value.description
    }
    
    
    
    private let btnreg:UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("NEXT", for: .normal)
        btn1.backgroundColor = .red
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(click), for: .touchUpInside)
        return btn1
        
    }()
    @objc func click()
    {
        let hm = HomePage()
        //let nav = UINavigationController(rootViewController: reg)
        navigationController?.pushViewController(hm, animated: false)
        //nav.setNavigationBarHidden(true, animated: false)
        present(hm,animated: false)
        print("click")
    }
    //picker view
    private let lblpicker : UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Department And Designation"
        return lbl
    }()
    
    private let pickerview = UIPickerView()
    
    private let data=["SALES","MARKETING","BACKOFFICE","ACCOUNTING"]
    private let data2=["EMPLOYEE","MANAGER","TEAMLEADER","SUPERVISER"]
    
    private let myprog:UIProgressView={
        let prog=UIProgressView()
        prog.setProgress(0.0, animated: true)
        return prog
        
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.myprog.setProgress(1.0, animated: true)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(txtuname)
        view.addSubview(lbluname)
        view.addSubview(lbldob)
        view.addSubview(dob)
        view.addSubview(mysegment)
        view.addSubview(PageControl)
        view.addSubview(lblsal)
        view.addSubview(myslidersal)
        view.addSubview(lblsalval)
        view.addSubview(lblsteper)
        view.addSubview(myateper)
        view.addSubview(lblsteperval)
        view.addSubview(btnreg)
       
        view.addSubview(lblpicker)
        view.addSubview(pickerview)
        pickerview.delegate = self
        pickerview.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbluname.frame = CGRect(x: 20, y: 40, width: view.frame.size.width-40, height: 30)
        txtuname.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 30)
        lbldob.frame = CGRect(x: 20, y: 120, width: view.frame.size.width-40, height: 30)
        dob.frame = CGRect(x: 20, y: 160, width: view.frame.size.width-40, height: 50)
        PageControl.frame = CGRect(x: 20, y: 230, width: view.frame.size.width-40, height: 50)
        mysegment.frame = CGRect(x: 20, y: 295, width: view.frame.size.width-40, height: 40)
        lblsal.frame = CGRect(x: 20, y: 345, width: view.frame.size.width-40, height: 30)
        myslidersal.frame = CGRect(x: 20, y: 370, width: view.frame.size.width-40, height: 30)
        lblsalval.frame = CGRect(x: view.frame.size.width/2 - 10, y: 405, width: view.frame.size.width-40, height: 30)
        lblsteper.frame = CGRect(x: 20, y: 445, width: view.frame.size.width-40, height: 30)
        myateper.frame = CGRect(x: 20, y: 480, width: view.frame.size.width-40, height: 30)
        lblsteperval.frame = CGRect(x: 60, y: 515, width: view.frame.size.width-40, height: 20)
        btnreg.frame = CGRect(x: 20, y: 620, width: view.frame.size.width-40, height: 40)
        lblpicker.frame = CGRect(x: 20, y: 535, width: view.frame.size.width, height: 30)
        pickerview.frame = CGRect(x: 20, y: 570, width: view.frame.size.width-40, height: 50)
    }


}
extension Registration : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0
        {
            return data.count
        }
        else
        {
            return data2.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0
        {
            return data[row]
        }
        else
        {
            return data2[row]
        }
    }
    
}
