-- Create a new database.
create database cancer_patient_platform;

-- Via the Docker Compose file, a special user called webapp will be created in MySQL. Grant that user all privilages to the new database we just created.
grant all privileges on cancer_patient_platform.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
use cancer_patient_platform;

-- Cancer Type table
insert into cancer_type (cancer_type_id, name, description) values (1, 'Toxic effect of venom of scorpion, accidental, init', 'Insertion of Facet Replacement Spinal Stabilization Device into Occipital-cervical Joint, Percutaneous Approach');
insert into cancer_type (cancer_type_id, name, description) values (2, 'Open bite of unspecified external genital organs', 'Fragmentation in Uterus, External Approach');
insert into cancer_type (cancer_type_id, name, description) values (3, 'Capslr glaucoma w/pseudxf lens, unsp eye, indeterminate stg', 'Dressing of Face using Bandage');
insert into cancer_type (cancer_type_id, name, description) values (4, 'Oth incomplete lesion at C4, sequela', 'Tomographic (Tomo) Nuclear Medicine Imaging of Pelvic Region using Fluorine 18 (F-18)');
insert into cancer_type (cancer_type_id, name, description) values (5, 'Burn of third degree of right toe(s) (nail)', 'Reattachment of Left Foot Tendon, Open Approach');
insert into cancer_type (cancer_type_id, name, description) values (6, 'Nondisp Maisonneuve''s fx l leg, 7thQ', 'Revision of Internal Fixation Device in Right Sacroiliac Joint, Open Approach');
insert into cancer_type (cancer_type_id, name, description) values (7, 'Occ of anml-drn vehicle injured in clsn w ped/anml, init', 'Insertion of Intraluminal Device into Large Intestine, Percutaneous Approach');
insert into cancer_type (cancer_type_id, name, description) values (8, 'Assault by drowning and submersion while in bathtub, init', 'Magnetic Resonance Imaging (MRI) of Bilateral Kidneys using Other Contrast');
insert into cancer_type (cancer_type_id, name, description) values (9, 'Stable burst fracture of fourth thoracic vertebra, sequela', 'High Dose Rate (HDR) Brachytherapy of Duodenum using Californium 252 (Cf-252)');
insert into cancer_type (cancer_type_id, name, description) values (10, 'Injury of median nerve at forearm level, left arm, init', 'Restriction of Cervix, Percutaneous Endoscopic Approach');
insert into cancer_type (cancer_type_id, name, description) values (11, 'Injury of vertebral artery', 'Bypass Ileum to Descending Colon, Via Natural or Artificial Opening Endoscopic');
insert into cancer_type (cancer_type_id, name, description) values (12, 'Partial traumatic MCP amputation of left thumb, sequela', 'Supplement Right Axillary Vein with Autologous Tissue Substitute, Open Approach');
insert into cancer_type (cancer_type_id, name, description) values (13, 'Pain in right foot', 'Dilation of Left Ulnar Artery with Four or More Intraluminal Devices, Open Approach');
insert into cancer_type (cancer_type_id, name, description) values (14, 'Unsp fx shaft of unsp tibia, subs for clos fx w routn heal', 'Supplement Scrotum with Nonautologous Tissue Substitute, Percutaneous Endoscopic Approach');
insert into cancer_type (cancer_type_id, name, description) values (15, 'Contact with workbench tool, subsequent encounter', 'Revision of Nonautologous Tissue Substitute in Tracheobronchial Tree, Open Approach');

-- Users table
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (1, 'Babbie', 'Bettles', 'Administrative Assistant III', '10/07/1975', 'Non-binary', 'Bloomington', 'Illinois', '12', 'bbettles0@t.co', 'bbettles0@techcrunch.com', '309-203-5885', '785-967-9662');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (2, 'Daryl', 'Conen', 'Statistician I', '01/03/2007', 'Female', 'Young America', 'Minnesota', '1', 'dconen1@huffingtonpost.com', 'dconen1@yellowpages.com', '952-697-7775', '312-665-0800');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (3, 'Iolanthe', 'Kull', 'Developer II', '08/18/2022', 'Female', 'Naples', 'Florida', '2', 'ikull2@merriam-webster.com', 'ikull2@soundcloud.com', '305-233-2032', '503-505-3712');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (4, 'Bentlee', 'Pyecroft', 'Developer III', '08/19/2021', 'Bigender', 'Memphis', 'Tennessee', '6', 'bpyecroft3@mashable.com', 'bpyecroft3@instagram.com', '615-771-9855', '585-920-1622');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (5, 'Gaspar', 'Bowmer', 'Tax Accountant', '03/05/1997', 'Genderqueer', 'Spokane', 'Washington', '5', 'gbowmer4@umich.edu', 'gbowmer4@reddit.com', '509-685-1319', '816-418-6791');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (6, 'Gideon', 'Duplain', 'Staff Accountant IV', '09/08/1954', 'Male', 'Grand Forks', 'North Dakota', '10', 'gduplain5@amazon.de', 'gduplain5@tumblr.com', '701-921-0359', '915-933-7533');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (7, 'Ezekiel', 'McPhilip', 'Assistant Manager', '08/09/1975', 'Male', 'Raleigh', 'North Carolina', '14', 'emcphilip6@nasa.gov', 'emcphilip6@aol.com', '919-545-4875', '801-436-2614');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (8, 'Ingmar', 'Charer', 'Assistant Media Planner', '09/21/1990', 'Male', 'Flint', 'Michigan', '3', 'icharer7@cpanel.net', 'icharer7@hhs.gov', '810-361-7231', '956-763-3371');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (9, 'Kalina', 'Byer', 'Professor', '05/30/1959', 'Female', 'Fresno', 'California', '8', 'kbyer8@vinaora.com', 'kbyer8@addthis.com', '559-610-2434', '510-234-6064');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (10, 'Lowell', 'Golby', 'Senior Sales Associate', '07/11/1987', 'Male', 'Alexandria', 'Virginia', '15', 'lgolby9@narod.ru', 'lgolby9@mashable.com', '571-560-1589', '408-119-1435');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (11, 'Graeme', 'Whiting', 'Quality Control Specialist', '04/18/1985', 'Male', 'Charlotte', 'North Carolina', '13', 'gwhitinga@mysql.com', 'gwhitinga@nifty.com', '704-894-4482', '808-312-8488');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (12, 'Loree', 'Barttrum', 'Director of Sales', '03/26/1975', 'Female', 'Conroe', 'Texas', '11', 'lbarttrumb@craigslist.org', 'lbarttrumb@gov.uk', '936-482-6124', '803-320-1701');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (13, 'Elissa', 'Habishaw', 'Dental Hygienist', '09/01/2001', 'Genderqueer', 'Phoenix', 'Arizona', '9', 'ehabishawc@jiathis.com', 'ehabishawc@unicef.org', '480-779-4777', '915-788-2628');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (14, 'Kliment', 'Garrattley', 'Staff Accountant II', '07/17/1979', 'Male', 'Jacksonville', 'Florida', '7', 'kgarrattleyd@quantcast.com', 'kgarrattleyd@cornell.edu', '904-927-9779', '702-716-5101');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (15, 'Mei', 'Shakesby', 'Graphic Designer', '01/19/1989', 'Female', 'New York City', 'New York', '4', 'mshakesbye@netlog.com', 'mshakesbye@nydailynews.com', '917-620-8264', '202-283-8104');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (16, 'Suzy', 'Gamlen', 'Legal Assistant', '05/21/2014', 'Female', 'Dallas', 'Texas', '2', 'sgamlenf@opensource.org', 'sgamlenf@sourceforge.net', '972-340-8641', '202-260-8751');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (17, 'Anabella', 'Loughnan', 'Clinical Specialist', '03/18/1988', 'Female', 'New York City', 'New York', '3', 'aloughnang@comcast.net', 'aloughnang@home.pl', '212-982-0719', '912-941-6675');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (18, 'Cristal', 'Van Merwe', 'Research Assistant IV', '08/09/1968', 'Female', 'Indianapolis', 'Indiana', '7', 'cvanmerweh@arstechnica.com', 'cvanmerweh@vk.com', '317-932-8130', '360-773-9130');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (19, 'Agace', 'Pinckard', 'Internal Auditor', '07/10/1971', 'Female', 'Boston', 'Massachusetts', '14', 'apinckardi@dagondesign.com', 'apinckardi@imageshack.us', '508-182-0182', '716-816-5817');
insert into user (user_id, first_name, last_name, occupation, birth_date, gender, city, state, cancer_type_id, email_1, email_2, phone_1, phone_2) values (20, 'Louisette', 'Longley', 'Engineer I', '08/14/1993', 'Female', 'Birmingham', 'Alabama', '9', 'llongleyj@360.cn', 'llongleyj@guardian.co.uk', '205-994-8093', '615-404-4179');

-- Treatment table
insert into treatment (treatment_id, name, description) values (1, 'Tinidazole', 'Microscopic examination of specimen from bladder, urethra, prostate, seminal vesicle, perivesical tissue, and of urine and semen, cell block and Papanicolaou smear');
insert into treatment (treatment_id, name, description) values (2, 'Octinoxate and Titanium dioxide', 'Microscopic examination of specimen from lymph node and of lymph, bacterial smear');
insert into treatment (treatment_id, name, description) values (3, 'NITROGEN', 'Open reduction of fracture without internal fixation, unspecified site');
insert into treatment (treatment_id, name, description) values (4, 'Promethazine Hydrochloride', 'Transapical replacement of aortic valve');
insert into treatment (treatment_id, name, description) values (5, 'meloxicam', 'Percutaneous ablation of renal lesion or tissue');
insert into treatment (treatment_id, name, description) values (6, 'PREGABALIN', 'Exploration of thymus field');
insert into treatment (treatment_id, name, description) values (7, 'Alcohol', 'Microscopic examination of blood, toxicology');
insert into treatment (treatment_id, name, description) values (8, 'Pyrrole,', 'Laparoscopic salpingo-oophoroplasty');
insert into treatment (treatment_id, name, description) values (9, 'bimatoprost', 'Open biopsy of tongue');
insert into treatment (treatment_id, name, description) values (10, 'METFORMIN HYDROCHLORIDE', 'Other diagnostic procedures on spinal cord and spinal canal structures');
insert into treatment (treatment_id, name, description) values (11, 'Lidocaine', 'Autologous hematopoietic stem cell transplant without purging');
insert into treatment (treatment_id, name, description) values (12, 'Avobenzone, Homosalate, Octisalate, and Octocrylene', 'Administration of other antitoxins');
insert into treatment (treatment_id, name, description) values (13, 'Black Locust', 'Insertion of spinal disc prosthesis, thoracic');
insert into treatment (treatment_id, name, description) values (14, 'Dicloxacillin Sodium', 'Insertion or replacement of skull tongs or halo traction device');
insert into treatment (treatment_id, name, description) values (15, 'Quinapril', 'Arterial catheterization');
insert into treatment (treatment_id, name, description) values (16, 'Avobenzone,Homosalate,Octisalate,Oxybenzone', 'Closed reduction of separated epiphysis, humerus');
insert into treatment (treatment_id, name, description) values (17, 'TRAMADOL HYDROCHLORIDE', 'Cystoscopy through artificial stoma');
insert into treatment (treatment_id, name, description) values (18, 'amiodarone hydrochloride', 'Other operations on lacrimal gland');
insert into treatment (treatment_id, name, description) values (19, 'Cetirizine HCl', 'Closure of esophagostomy');
insert into treatment (treatment_id, name, description) values (20, 'MEPROBAMATE', 'Division of joint capsule, ligament, or cartilage, elbow');

#Support group table
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (1, '3', 'Justino Thwaite', null, 16);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (2, '4', 'Gaston Grimsell', 'Coimbra', 12);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (3, '5', 'Noland Dundredge', null, 35);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (4, '1', 'Ronalda Cordero', null, 38);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (5, '2', 'Halette Dennert', 'Braga', 38);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (6, '2', 'Alard Braisted', 'Illinois', 40);
insert into support_group (support_group_id, group_leader_id, name, location, capacity) values (7, '1', 'Faustina Vynarde', null, 34);

#Symptom table
insert into symptom (symptom_id, name, description) values (1, 'Embryonic cyst of cervix', 'Embryonic cyst of cervix');
insert into symptom (symptom_id, name, description) values (2, 'Oth foreign object in trachea causing oth injury, subs', 'Other foreign object in trachea causing other injury, subsequent encounter');
insert into symptom (symptom_id, name, description) values (3, 'Other superficial bite of left elbow, subsequent encounter', 'Other superficial bite of left elbow, subsequent encounter');
insert into symptom (symptom_id, name, description) values (4, 'Other hookworm diseases', 'Other hookworm diseases');
insert into symptom (symptom_id, name, description) values (5, 'Oth disrd of synovium and tendon, unspecified elbow', 'Other specified disorders of synovium and tendon, unspecified elbow');
insert into symptom (symptom_id, name, description) values (6, 'Type I occipital condyle fracture, left side, 7thG', 'Type I occipital condyle fracture, left side, subsequent encounter for fracture with delayed healing');
insert into symptom (symptom_id, name, description) values (7, 'Stress fracture, pelvis, initial encounter for fracture', 'Stress fracture, pelvis, initial encounter for fracture');
insert into symptom (symptom_id, name, description) values (8, 'Displ commnt fx shaft of unsp fibula, 7thP', 'Displaced comminuted fracture of shaft of unspecified fibula, subsequent encounter for closed fracture with malunion');
insert into symptom (symptom_id, name, description) values (9, 'Unsp fx upr end unsp rad, 7thE', 'Unspecified fracture of upper end of unspecified radius, subsequent encounter for open fracture type I or II with routine healing');
insert into symptom (symptom_id, name, description) values (10, 'Strain extn/abdr musc/fasc/tend of r thm at forarm lv, init', 'Strain of extensor or abductor muscles, fascia and tendons of right thumb at forearm level, initial encounter');
insert into symptom (symptom_id, name, description) values (11, 'Newborn affected by abnormality of membranes, unspecified', 'Newborn affected by abnormality of membranes, unspecified');
insert into symptom (symptom_id, name, description) values (12, 'Athscl autol vein bypass of the left leg w ulcer of calf', 'Atherosclerosis of autologous vein bypass graft(s) of the left leg with ulceration of calf');
insert into symptom (symptom_id, name, description) values (13, 'Explosion on board unspecified watercraft', 'Explosion on board unspecified watercraft');
insert into symptom (symptom_id, name, description) values (14, 'Crushing injury of right wrist, initial encounter', 'Crushing injury of right wrist, initial encounter');
insert into symptom (symptom_id, name, description) values (15, 'Other superficial injuries of shoulder', 'Other superficial injuries of shoulder');
insert into symptom (symptom_id, name, description) values (16, 'Oth ultralt/microlt/pwr-glider acc injuring occupant, subs', 'Other ultralight, microlight or powered-glider accident injuring occupant, subsequent encounter');
insert into symptom (symptom_id, name, description) values (17, 'Dislocation of proximal interphaln joint of l rng fngr, init', 'Dislocation of proximal interphalangeal joint of left ring finger, initial encounter');
insert into symptom (symptom_id, name, description) values (18, 'Struck by object due to collapse of building, init encntr', 'Struck by object due to collapse of building, initial encounter');
insert into symptom (symptom_id, name, description) values (19, 'Disloc of distal interphaln joint of left thumb, sequela', 'Dislocation of distal interphalangeal joint of left thumb, sequela');
insert into symptom (symptom_id, name, description) values (20, 'Injury of unspecified iliac vein, subsequent encounter', 'Injury of unspecified iliac vein, subsequent encounter');

#Exhibits table
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('13', '9', '07/01/2014', '02/14/1982', 'Mal neo paraurethral');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('1', '8', '12/25/1952', '06/19/1990', 'Cl skl w oth fx w/o coma');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('9', '3', '04/05/1958', '06/11/2011', 'Ac infect polyneuritis');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('6', '7', '11/18/1964', '03/20/1974', 'Hered hemolytic anem NEC');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('12', '13', '04/30/1963', '03/07/1982', 'Gonococcal peritonitis');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('15', '1', '08/04/1949', '02/07/1982', 'Acq deformity NEC');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('16', '20', '05/24/1960', '07/11/1965', 'Gastrojejun ulc NOS-obst');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('11', '15', '07/09/1986', '01/13/1953', 'Stomach cont asp w resp');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('4', '18', '01/04/1994', '05/14/1957', 'War inj:therml radiation');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('5', '10', '09/11/1962', '11/20/1962', 'Adv eff anti-common cold');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('2', '11', '11/04/1985', '03/30/1980', 'Cl skul fx NEC-deep coma');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('14', '17', '02/22/2021', '07/30/1970', 'Obesity-postpartum');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('7', '5', '03/20/1994', '02/03/1950', 'Histoplasm caps endocard');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('18', '2', '06/08/2022', '09/30/1980', 'Disturbances of vision');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('8', '4', '01/03/1975', '03/07/1971', 'Malig neo retromolar');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('17', '12', '05/29/1957', '03/13/1977', 'General medical exam NOS');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('20', '16', '10/17/2019', '12/29/2019', 'Excitativ type psychosis');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('19', '6', '10/24/2005', '03/18/2001', 'History-pre-term labor');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('10', '19', '02/28/1987', '11/06/2021', 'Dust pneumonopathy NEC');
insert into exhibits (user_id, symptom_id, start_date, end_date, severity) values ('3', '14', '11/24/1992', '08/29/1955', 'Ac laryngitis w obstruct');

#Typically exhibits table
insert into typically_exhibits (symptom_id, cancer_type_id) values ('19', '1');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('4', '4');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('7', '10');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('8', '3');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('16', '14');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('2', '2');
insert into typically_exhibits (symptom_id, cancer_type_id) values ('6', '7');

#Typically treated with table
insert into typically_treated_with (cancer_type_id, treatment_id) values ('8', '8');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('12', '12');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('4', '10');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('15', '13');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('3', '9');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('10', '20');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('1', '6');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('11', '3');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('14', '1');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('9', '7');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('13', '15');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('5', '5');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('6', '2');
insert into typically_treated_with (cancer_type_id, treatment_id) values ('2', '17');

#Makes connection table
insert into makes_connection (user_id_1, user_id_2, relationship) values (8, 2, 'stable');
insert into makes_connection (user_id_1, user_id_2, relationship) values (20, 18, 'incremental');
insert into makes_connection (user_id_1, user_id_2, relationship) values (1, 5, 'Adaptive');
insert into makes_connection (user_id_1, user_id_2, relationship) values (14, 12, 'radical');
insert into makes_connection (user_id_1, user_id_2, relationship) values (14, 16, 'methodology');
insert into makes_connection (user_id_1, user_id_2, relationship) values (3, 7, 'Secured');
insert into makes_connection (user_id_1, user_id_2, relationship) values (5, 19, 'demand-driven');
insert into makes_connection (user_id_1, user_id_2, relationship) values (16, 9, 'Synergized');
insert into makes_connection (user_id_1, user_id_2, relationship) values (17, 18, 'frame');
insert into makes_connection (user_id_1, user_id_2, relationship) values (17, 7, 'tertiary');
insert into makes_connection (user_id_1, user_id_2, relationship) values (14, 9, 'logistical');
insert into makes_connection (user_id_1, user_id_2, relationship) values (10, 18, 'moratorium');
insert into makes_connection (user_id_1, user_id_2, relationship) values (11, 18, 'Implemented');
insert into makes_connection (user_id_1, user_id_2, relationship) values (6, 13, 'Phased');
insert into makes_connection (user_id_1, user_id_2, relationship) values (10, 1, 'global');
insert into makes_connection (user_id_1, user_id_2, relationship) values (14, 15, 'Universal');
insert into makes_connection (user_id_1, user_id_2, relationship) values (8, 18, 'instruction set');
insert into makes_connection (user_id_1, user_id_2, relationship) values (4, 7, 'Robust');
insert into makes_connection (user_id_1, user_id_2, relationship) values (9, 1, 'client-server');
insert into makes_connection (user_id_1, user_id_2, relationship) values (19, 9, 'methodical');
insert into makes_connection (user_id_1, user_id_2, relationship) values (14, 19, 'paradigm');
insert into makes_connection (user_id_1, user_id_2, relationship) values (3, 2, 'attitude');
insert into makes_connection (user_id_1, user_id_2, relationship) values (17, 13, 'client-server');
insert into makes_connection (user_id_1, user_id_2, relationship) values (13, 20, 'uniform');
insert into makes_connection (user_id_1, user_id_2, relationship) values (19, 9, 'directional');
insert into makes_connection (user_id_1, user_id_2, relationship) values (1, 4, 'heuristic');
insert into makes_connection (user_id_1, user_id_2, relationship) values (7, 11, 'complexity');
insert into makes_connection (user_id_1, user_id_2, relationship) values (1, 5, 'Programmable');
insert into makes_connection (user_id_1, user_id_2, relationship) values (12, 11, 'methodical');

#Medical professional table
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (1, 'Billy', 'McCuffie', 'Unc beh neo brain/spinal', '17');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (2, 'Archibald', 'Dermot', 'Open wound auricle-compl', '4');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (3, 'Doti', 'Pleace', 'Infect nipple preg-unsp', '5');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (4, 'Kalil', 'Bucknell', 'Delay conjugat jaund NOS', '15');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (5, 'Herbert', 'Endersby', 'Viral pneumonia NEC', '14');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (6, 'Georgeanne', 'Rummer', 'Benign neo skin ear', '13');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (7, 'Bethanne', 'Tomley', 'C1-c4 fx-op/cen cord syn', '3');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (8, 'Ware', 'Portam', 'Flat anterior chamber', '1');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (9, 'Nicko', 'Boustred', 'Adv eff mix bact vaccine', '12');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (10, 'Benyamin', 'Trevor', 'Fx shaft tibia-closed', '8');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (11, 'Con', 'Knee', 'Mv collis NOS-pers NOS', '20');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (12, 'Dotty', 'Shitliffe', 'TB fem gen NEC-oth test', '6');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (13, 'Nigel', 'Emmens', 'Extradural hemor-no coma', '10');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (14, 'Desiri', 'Paydon', 'Popliteal synovial cyst', '18');
insert into medical_professional (professional_id, first_name, last_name, specialty, treatment_id) values (15, 'Angelita', 'Ida', 'Late eff motor vehic acc', '16');

#Treatment center table
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (1, '8773 Old Gate Plaza', 'AL', 'Birmingham', '29', '6', 'vbroxholme0@netvibes.com', 'amcgready0@dailymail.co.uk', '205-449-5880', '720-697-6765');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (2, '44 Texas Court', 'MA', 'Newton', '8', '1737', 'ikeynes1@craigslist.org', 'fhaskell1@taobao.com', '508-112-3218', '805-160-9624');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (3, '51 Dovetail Trail', 'KY', 'Louisville', '20043', '03840', 'alancley2@nifty.com', 'mburgan2@livejournal.com', '502-584-5922', '202-164-1134');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (4, '075 Sundown Pass', 'CA', 'San Jose', '7819', '274', 'xhamber3@tiny.cc', 'prougier3@google.ca', '408-143-3468', '804-298-2811');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (5, '08350 Grayhawk Way', 'NY', 'New York City', '4088', '9', 'jhansard4@is.gd', 'cglas4@scientificamerican.com', '212-210-7513', '716-519-2235');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (6, '4425 South Plaza', 'GA', 'Atlanta', '8', '9277', 'rcowle5@goodreads.com', 'ldickenson5@so-net.ne.jp', '404-522-1254', '215-256-6422');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (7, '44 Maple Circle', 'PA', 'Bethlehem', '8901', '65227', 'fhinkens6@theguardian.com', 'gphillipps6@uiuc.edu', '610-397-3972', '206-875-8447');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (8, '1762 Oxford Center', 'CO', 'Denver', '63892', '86', 'mhurne7@discuz.net', 'bbaldazzi7@hud.gov', '303-748-8552', '727-318-6917');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (9, '790 Florence Point', 'CA', 'Orange', '4', '73', 'mhuffey8@hexun.com', 'mklossmann8@friendfeed.com', '760-170-4763', '312-364-9811');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (10, '8653 Katie Circle', 'TX', 'Austin', '93', '597', 'codevey9@over-blog.com', 'ashimon9@elegantthemes.com', '512-506-8312', '559-849-4933');
insert into treatment_center (center_id, street_address, state, city, zip_code, professional_id, email_1, email_2, phone_1, phone_2) values (11, '31803 Killdeer Court', 'AZ', 'Phoenix', '09', '6425', 'hcamelia@pinterest.com', 'walesioa@multiply.com', '623-187-8557', '513-108-0537');

#Medication table
insert into medication (medication_id, name, description) values (1, 'Warfarin Sodium', 'Imaging, Axial Skel, Exc Skull Facial, CT Scan');
insert into medication (medication_id, name, description) values (2, 'CTCA Foaming Hand Sanitizer', 'Inspection of Lower Intestinal Tract, Percutaneous Approach');
insert into medication (medication_id, name, description) values (3, 'Rugby', 'LDR Brachytherapy of Pancreas using Oth Isotope');
insert into medication (medication_id, name, description) values (4, 'Head and Shoulders', 'Bypass R Int Iliac Art to Low Ex Art, Perc Endo Approach');
insert into medication (medication_id, name, description) values (5, 'Artificial Tears', 'Revision of Autol Sub in R Ankle Jt, Extern Approach');
insert into medication (medication_id, name, description) values (6, 'Clean All', 'Supplement Uvula with Synthetic Substitute, Open Approach');
insert into medication (medication_id, name, description) values (7, 'Pollen Mix', 'Repair Bilateral External Ear, Perc Endo Approach');
insert into medication (medication_id, name, description) values (8, 'SAVELLA', 'Transfuse of Autol Platelets into Central Art, Perc Approach');
insert into medication (medication_id, name, description) values (9, 'Sunmark Chest Congestion Relief DM', 'CT Scan of R Eye using H Osm Contrast');
insert into medication (medication_id, name, description) values (10, 'Medroxyprogesterone Acetate', 'Exercise Treatment of Musculosk Up Back/UE using Orthosis');
insert into medication (medication_id, name, description) values (11, 'Epitol', 'Restriction of Right Subclavian Vein, Percutaneous Approach');
insert into medication (medication_id, name, description) values (12, 'White Real Time Pain Relief', 'Fusion of Right Elbow Joint with Nonaut Sub, Open Approach');
insert into medication (medication_id, name, description) values (13, 'OXY Clinical', 'Bypass R Axilla Art to L Extracran Art w Nonaut Sub, Open');

#Symptom treated with table
insert into symptom_treated_with (symptom_id, medication_id) values ('8', '6');
insert into symptom_treated_with (symptom_id, medication_id) values ('7', '8');
insert into symptom_treated_with (symptom_id, medication_id) values ('14', '1');
insert into symptom_treated_with (symptom_id, medication_id) values ('18', '7');
insert into symptom_treated_with (symptom_id, medication_id) values ('20', '12');
insert into symptom_treated_with (symptom_id, medication_id) values ('10', '4');
insert into symptom_treated_with (symptom_id, medication_id) values ('5', '10');

#Involves table
insert into involves (treatment_id, medication_id) values ('8', '2');
insert into involves (treatment_id, medication_id) values ('17', '9');
insert into involves (treatment_id, medication_id) values ('6', '1');
insert into involves (treatment_id, medication_id) values ('1', '8');
insert into involves (treatment_id, medication_id) values ('3', '10');
insert into involves (treatment_id, medication_id) values ('18', '13');

#Member of table
insert into member_of (support_group_id, user_id) values ('7', '8');
insert into member_of (support_group_id, user_id) values ('5', '13');
insert into member_of (support_group_id, user_id) values ('2', '7');
insert into member_of (support_group_id, user_id) values ('4', '16');
insert into member_of (support_group_id, user_id) values ('6', '9');
insert into member_of (support_group_id, user_id) values ('1', '3');
insert into member_of (support_group_id, user_id) values ('3', '2');
insert into member_of (support_group_id, user_id) values ('2', '20');
insert into member_of (support_group_id, user_id) values ('5', '14');
insert into member_of (support_group_id, user_id) values ('3', '15');
insert into member_of (support_group_id, user_id) values ('4', '17');
insert into member_of (support_group_id, user_id) values ('7', '19');
insert into member_of (support_group_id, user_id) values ('1', '5');
insert into member_of (support_group_id, user_id) values ('6', '4');

#Supported by table
insert into supported_by (resource_id, user_id) values ('5', '7');
insert into supported_by (resource_id, user_id) values ('4', '6');
insert into supported_by (resource_id, user_id) values ('13', '14');
insert into supported_by (resource_id, user_id) values ('7', '9');
insert into supported_by (resource_id, user_id) values ('2', '15');
insert into supported_by (resource_id, user_id) values ('1', '2');
insert into supported_by (resource_id, user_id) values ('6', '11');

#Meeting table
insert into meeting (meeting_number, support_group_id) values (1, '6');
insert into meeting (meeting_number, support_group_id) values (2, '7');
insert into meeting (meeting_number, support_group_id) values (3, '1');
insert into meeting (meeting_number, support_group_id) values (4, '4');
insert into meeting (meeting_number, support_group_id) values (5, '5');
insert into meeting (meeting_number, support_group_id) values (6, '2');
insert into meeting (meeting_number, support_group_id) values (7, '3');
insert into meeting (meeting_number, support_group_id) values (8, '5');
insert into meeting (meeting_number, support_group_id) values (9, '2');
insert into meeting (meeting_number, support_group_id) values (10, '3');
insert into meeting (meeting_number, support_group_id) values (11, '7');
insert into meeting (meeting_number, support_group_id) values (12, '6');
insert into meeting (meeting_number, support_group_id) values (13, '1');
insert into meeting (meeting_number, support_group_id) values (14, '4');
insert into meeting (meeting_number, support_group_id) values (15, '3');

