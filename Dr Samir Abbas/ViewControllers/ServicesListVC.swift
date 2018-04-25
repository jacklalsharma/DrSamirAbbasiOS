//
//  ServicesListVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 15/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import UIKit

class ServicesListVC : BaseVC , UITableViewDataSource, UITableViewDelegate{
    
    var images = [#imageLiteral(resourceName: "women"), #imageLiteral(resourceName: "obstetrics"), #imageLiteral(resourceName: "reproductive"), #imageLiteral(resourceName: "maternal_fetal_medicine"), #imageLiteral(resourceName: "andrology"), #imageLiteral(resourceName: "dermotology"), #imageLiteral(resourceName: "surgery"), #imageLiteral(resourceName: "pediatrics"), #imageLiteral(resourceName: "plastic_surgery"), #imageLiteral(resourceName: "womens_breast"), #imageLiteral(resourceName: "bariatric_surgery"), #imageLiteral(resourceName: "ophthalmology"), #imageLiteral(resourceName: "oto"), #imageLiteral(resourceName: "rthopaedics"), #imageLiteral(resourceName: "pulmonologist"), #imageLiteral(resourceName: "gastroenterology"), #imageLiteral(resourceName: "non_invasive_cardiology"), #imageLiteral(resourceName: "anaesthesia"), #imageLiteral(resourceName: "intensive_care_unit"), #imageLiteral(resourceName: "dietary_services"), #imageLiteral(resourceName: "stem_cells"), #imageLiteral(resourceName: "emergency"), #imageLiteral(resourceName: "pediatrics")]
    
    var scrollHeight : CGFloat!
    
    var btn = [FlatButton]()
    
    var desc = [UILabel]()
    
    var status = [Bool]()
    
    var descImage = [UIImageView]()
    
    var heading = ["services_list_heading[0]".localizedString, "services_list_heading[1]".localizedString, "services_list_heading[2]".localizedString, "services_list_heading[3]".localizedString, "services_list_heading[4]".localizedString, "services_list_heading[5]".localizedString, "services_list_heading[6]".localizedString, "services_list_heading[7]".localizedString, "services_list_heading[8]".localizedString, "services_list_heading[8]".localizedString, "services_list_heading[10]".localizedString, "services_list_heading[11]".localizedString, "services_list_heading[12]".localizedString, "services_list_heading[13]".localizedString, "services_list_heading[14]".localizedString, "services_list_heading[15]".localizedString, "services_list_heading[16]".localizedString, "services_list_heading[17]".localizedString, "services_list_heading[18]".localizedString, "services_list_heading[19]".localizedString, "services_list_heading[20]".localizedString, "services_list_heading[21]".localizedString, "services_list_heading[22]".localizedString]
    
    var descHeadings = ["services_list_content[0]".localizedString, "services_list_content[1]".localizedString, "services_list_content[2]".localizedString, "services_list_content[3]".localizedString, "services_list_content[4]".localizedString, "services_list_content[5]".localizedString, "services_list_content[6]".localizedString
    ,"services_list_content[7]".localizedString, "services_list_content[8]".localizedString, "services_list_content[9]".localizedString, "services_list_content[10]".localizedString, "services_list_content[11]".localizedString, "services_list_content[12]".localizedString, "services_list_content[13]".localizedString, "services_list_content[14]".localizedString, "services_list_content[15]".localizedString, "services_list_content[16]".localizedString, "services_list_content[17]".localizedString, "services_list_content[18]".localizedString, "services_list_content[19]".localizedString, "services_list_content[20]".localizedString, "services_list_content[21]".localizedString, "services_list_content[22]".localizedString]
    
    /*
    var descHeadings = ["Dr. Samir Abbas’s Women’s Health Department offers a coordinated, customised care in a compassionate environment. We aim to blend outstanding medical treatment with remarkable personal care, and our women’s health services enhance this goal by combining numerous specialties. Women, in every stage of their lives, can count on receiving undivided attention and personalized treatment in our hospital. Additionally, our physicians conduct several clinical trials to advance patient care.", "We have an extraordinary team of obstetricians, gynaecologists, and other medical professionals who are committed to providing compassionate, research validated effective care and treatment to patients. Using the latest technologies and techniques, our specialists provide diagnosis and treatment for a full range of obstetric and gynaecological conditions.\n\n• Help pregnant women in achieving an enjoyable pregnancy in each stage of the journey and a comfortable, pain controlled, safe delivery.\n\n• Looking after the health needs of women in pre conception stage for advice and before and after delivery.\n\n• Contraceptive advice, tailored for couples seeking pregnancy spacing.\n\n• Managing benign gynaecological illness.\n\n• Dealing with gynaecological emergencies.\n\n• Performing gynaecological endoscopic surgery." , "Our highly skilled endocrinologists at Dr. Samir Abbas Hospital treat patients within a wide spectrum of endocrine disorders. They are specialised in managing endocrine disorders.\n\n•Helping couples to achieve a safe pregnancy using state of art assisted reproductive techniques.\n\n• Managing menstrual problems.\n\n• Managing menopausal symptoms and concerns.", "The Andrology department at Dr. Samir Abbas Hospital provides compassionate, specialised and advanced management of complex pregnancies for women and their unborn children. Services include: Family planning and counselling, Genetic counselling, prenatal testing and diagnoses, prenatal care tailored to the needs of each mother and other consultations and diagnostic services.\n\n• Performing high level in utero fetal ultrasounds.\n\n• Early intervention in identified risks to mother and fetus.\n\n• Advise on outcomes of complicated pregnancies.\n\n• Managing high risk pregnancies.\n\n• Managing high risk deliveries and complicated caesarean sections.", "The Andrology department at Dr. Samir Abbas Hospital, shared by senior consultant, offers a full range of specialised tests and services for the evaluation and treatment of male infertility. We provide an excellent setting for couples to achieve their reproductive goals.\n\n• Helping men with sexual dysfunctions to achieve normality.\n\n• Assist the reproductive endocrinology unit in managing men with the inability to reproduce.\n\n• Assisting in diagnoses/ correcting sexual dysfunction in men.\n\n• Working closely with endocrinology unit to assist in male reproduction management.\n\n• Performing surgical corrective male reproductive tract procedures.", "Houston Methodist dermatologists deliver specialised care to patients suffering from diseases or conditions affecting the skin. They offer diagnosis and treatment of a variety of common and less common skin conditions. The Cosmetology department at our hospital is also led by some top most cosmetic surgeons. The department is well-equipped and is proficient to handle all kinds of cosmetology requirements.Using latest technologies and experts in the field, we offer our individually planned services in a relaxing environment.\n\n• Dealing with benign skin conditions.\n\n• Improving skin conditions and dealing with wrinkled skin.\n\n• Improvement of most skin conditions and treatment of age and sun damaged related skin.\n\n• Hair Transplants.\n\n• Permanent removal of unwanted hair.\n\n• Full skin care and beauty.", "Our integrated approach to provide safe and effective surgical care to you consists of informed patient care in an environment of latest technology in medical and surgical treatments. Our team of physicians and specialists work with you to ensure your before, during and after surgical care is optimal and of highest quality.\nWe have a great team of surgeons and health professionals who aim to achieve the best outcomes from your surgery. We offer expertise across a wide range of surgical and surgical support specialties, and our surgeons use the newest techniques and procedures to prevent/minimise complications.\n\n• Dealing with common surgical presentations:\n\n• Dealing with common surgical presentations:\n\n• body lumps\n\n• gastro-intestinal tract bleeding\n\n• painful orifice conditions", "We provide an optimal environment for even the most complex surgeries, based on today’s most sophisticated technology and advanced research.\n\n• Managing urinary tract infections.\n\n• Urinary stones\n\n• bladder dysfunction and incontinence.", "Our highly skilled specialists, experienced in improving appearance, function and mobility of patients, have access to the latest technologies related to reconstructive and cosmetic surgery.\n\n• Working in liaison with the department dermatology in achieving the patient desired facial and body appearance.\n\n• Breast reduction and augmentation.\n\n• Restorative surgery (scar revision, corrective surgery).", "Our hospital offers comprehensive assessment and treatment of breast disease, benign lumps and malignant growths. Our services include various aspects of the process of breast disease; prevention, detection, treatment choices and reconstructive surgery.Our support services include; genetic and nutritional counselling, psychosocial support and massage therapy assisting you through the treatment process.\n\n•A dedicated unit for:\n\n• Early detection screening.\n\n• Treatment of benign and malignant breast lumps.\n\n• Full support services throughout the process.", "We offer multiple surgical options using the most advanced techniques for treating obesity and its related conditions. The hospital is equipped with surgical suites, advanced equipment, and patient rooms customized for the care and comfort of bariatric patients.\n\n• A dedicated unit for:\n\n• Helping the obese to reduce weight through different approaches including surgeries, diet plans, psychology sessions and physical treatments.\n\n• Solutions offered surgically are permanent.", "Dr. Samir Abbas ophthalmologists have expertise in all subspecialties of ophthalmology, with access to specialized operating suites designed for unique conditions and complex eye surgeries. They provide patients with medical and surgical treatment for eye disorders and diseases in even the most challenging cases.\n\n• Management of benign eye conditions.\n\n• Corrective eye sight procedures.\n\n• Specialized anterior and posterior segment procedures.", "Our ENT specialists provide full range of medical and surgical services for patients with ear, nose and throat problems.\n\n• Early detection and management of hearing problems.\n\n• Surgery for tonsils and adenoids.\n\n• Correction of nasal deformities.\n\n• Sinus endoscopic surgery.\n\n• Surgery for snoring.", "Our skilled team of orthopaedic surgeons use the latest innovative techniques, pioneering new technology to deliver exceptional care to patients with musculoskeletal disease or injuries. As a patient at Dr. Samir Abbas Hospital, you will have access to unsurpassed the expertise of our multidisciplinary team of orthopaedic surgeons, delivering a full a full range of services.\n\n• Managing all types of fractures.\n\n• Performing all joint scopes.\n\n• Performing hip and knee replacements.", "Our pulmonologist in Dr. Samir Abbas Hospital is dedicated to treatment of a variety of lung diseases.\n\n• Management of common respiratory problems in adults such as bronchial asthma, pneumonia and other diseases presenting with breathing difficulties.\n\n• Performing lung function tests and advising on related positive lifestyle modification.", "Our gastroenterology team of doctors, nurses and other health care professionals work together to diagnose and treat digestive disorders. These include diseases of the oesophagus, stomach, liver, pancreas, gall bladder, biliary tract, and colon.\n\n• Managing digestion and gastro intestinal problems.\n\n• Performing diagnostic and therapeutic upper and lower gastro intestinal scopes.\n\n• Providing temporary interventional solutions for weight reduction such as gastric balloons.", "Non-invasive Cardiology Our non-invasive cardiologists focus on the detection and treatment of heart disease, using external tests—rather than instruments inserted into the body—to evaluate and diagnose cardiac disorders.\n\n• Providing general advice and management on risk factors for heart disease.\n\n• Medical diagnosis and investigation of cardiovascular conditions including angina pains, high blood pressure.\n\n• Providing blood thinning services (anti-coagulation).", "The type of anaesthesia administered will depend upon the procedure performed. We offer a full range of services, and patients are encouraged to discuss preferences for the type of service to be used with their surgeons and anaesthesiologists.\n\n• Provide safe anaesthesia and sedation to patients undergoing minor or major operations and procedures.\n\n• Provide epidural anaesthesia.\n\n• Effective management of post-operative pain.\n\n• Management of chronic pain.", "One of the goals of the ICU is to promote a healing environment. Our ICU is designed to care for patients with potentially life-threatening conditions and following major surgery when more intense monitoring and observation is required.\n\n• Provide support and management to patients admitted to adult critical care for medical or surgical reasons.", "Inpatient or outpatient, our dedicated team of professionals will help you define and reach your individual health goals.Maintaining a healthy weight and eating a well balanced nutritious can help you function in all aspects of your life. The team, headed by clinical dieticians oversee all dietary services provided.\n\n• Arranging therapeutic diets for inpatients.\n\n• Overseeing all food services provided.\n\n• Providing weight reduction advice and monitoring and general health education regarding positive life style.", "A new trend of therapy that will become a fundamental part of health management in the near future.\n\n• Joint pain relief.\n\n• Skin rejuvenation and others.", "Emergency Department of Dr. Samir Abbas Hospital provides patient care with critical situation services through a team of competent and dedicated doctors and specialists with high qualifications, in addition the department is fully equipped with the latest technologies, devices and tools.The emergency department provides patients with a high level of optimal medical care, in full coordination with a multidisciplinary approach with all medical and clinical departments, when needed and over 24 / 7. Taking strict precautions to control the infection in order to ensure the safety and comfort of patients and to gain their satisfaction, also we have created performance indicators that monitor the staff performance, seeking to remain the best and most trusted department of the region.", "The Pediatric and Neonatal Department at Dr. Samir Abbas Hospital provides integrated medical care for children from birth until the age of 14 under the supervision of a group of specialist and consultant physicians, 24 hours a day, seven days a week, in outpatient clinics, inpatient and emergency unit. In addition the newborn unit is equipped with cameras, where the mother can see her child anytime she likes. Also the Neonatal intensive care unit is equipped with state-of-the-art medical equipment, incubators and high-frequency ventilation."]
    */
    var list : UITableView!
    
    var heights = [Style.ScreenHeight / 1.5, Style.ScreenHeight * 1.1, Style.ScreenHeight / 1.4, Style.ScreenHeight / 1.05, Style.ScreenHeight / 1.05, Style.ScreenHeight / 0.95, Style.ScreenHeight, Style.ScreenHeight / 1.8, Style.ScreenHeight / 1.35, Style.ScreenHeight / 1.1, Style.ScreenHeight / 1.25, Style.ScreenHeight / 1.3, Style.ScreenHeight / 1.3, Style.ScreenHeight / 1.3, Style.ScreenHeight / 1.44, Style.ScreenHeight / 1.3, Style.ScreenHeight / 1.3, Style.ScreenHeight / 1.27,Style.ScreenHeight / 1.5, Style.ScreenHeight / 1.3 ,Style.ScreenHeight / 1.75, Style.ScreenHeight / 1.17, Style.ScreenHeight / 1.5]
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0

        status.reserveCapacity(23)
        btn.reserveCapacity(23)
        desc.reserveCapacity(23)
        descImage.reserveCapacity(23)
        
        for i in 0..<23{
            status.append(false)
        }
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(.wrap)
        
        relative.addSubview(getToolbar(title: "Services", isBackMenu: true, showNotification : false))
        relative.backgroundColor = Style.BackgroundColor
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)

        //STRIP VIEW...
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        relative.addSubview(strip)
        //....
        
        
        scrollHeight = scrollHeight + Style.ScreenHeight / 4
        
        let banner = UIImageView()
        banner.tg_width.equal(UIScreen.main.bounds.width)
        banner.tg_height.equal(Style.ScreenHeight/4)
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        
        
        scrollHeight = scrollHeight + Style.Height48 * 23 + 23 * 19
        var ll = LinearLayout(width: MATCH_PARENT, height: scrollHeight).vertical()
        ll.padding(left: 0, right: 0, top: Style.Height110, bottom: 0)
        ll.add(view: banner, w: Style.ScreenWidth, h: Style.ScreenHeight / 4)
        
        var listHeight = UIScreen.main.bounds.height - Style.ScreenHeight / 2.3
        list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(listHeight)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_top.equal(20)
        list.allowsSelection = false
        
        
        list.register(ServicesCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        for i in 0..<23{
            //ll.add(view: getCell(position : i), w: UIScreen.main.bounds.width, h: WRAP_CONTENT)
        }
        ll.add(view: getUIImageView(sizeX: 5, sizeY: Int(Style.Height20)), w: MATCH_PARENT, h: Style.Height20)
        ll.add(view: list, w: MATCH_PARENT, h: listHeight)
        ll.backgroundColor = Style.BackgroundColor
        
        view.addSubview(ll)
        view.addSubview(relative)
        view.backgroundColor = Style.BackgroundColor
    }
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        return image
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func expand(sender : UIButton){
        print(sender.tag)
        for i in 0..<23{
            if(status[i] == true){
                status[i] = false
                let indexPath = IndexPath(item: i, section: 0)
                list.reloadRows(at: [indexPath], with: .fade)
            }
            status[i] = false
            //Collapse that view...
            //descImage[i].isHidden = true
        }
        //Finally expand new view...
        status[sender.tag] = true
        //descImage[sender.tag].isHidden = false
        //list.reloadRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
        let indexPath = IndexPath(item: sender.tag, section: 0)
        list.reloadRows(at: [indexPath], with: .fade)
        //list.reloadData()
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:ServicesCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ServicesCell
        var val = heading[indexPath.row]
        cell.firstLetter.text = String (val[val.startIndex])
        
        
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: Style.TextSize18)]
        let attributedString = NSMutableAttributedString(string: val, attributes:attrs)
        cell.routeName.attributedText = attributedString

        
        let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: Style.TextSize18)]
        let attributedString2 = NSMutableAttributedString(string: descHeadings[indexPath.row], attributes:attrs2)
        
        
        
        cell.desc.attributedText = attributedString2
        if(status[indexPath.row]){
            cell.headingImage.isHidden = false
            cell.headingImage.image = images[indexPath.row]
            cell.desc.isHidden = false
        }else{
            cell.headingImage.isHidden = true
            cell.desc.isHidden = true
        }
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(expand(sender:)), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(status[indexPath.row]){
            return heights[indexPath.row]
        }
        return Style.Height60;//Choose your custom row height
    }
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 23
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    
}
