# noinspection SqlCurrentSchemaInspectionForFile

DROP DATABASE cancer_patient_platform


-- Create the database
CREATE DATABASE cancer_patient_platform;


-- Use the database
USE cancer_patient_platform;


-- Create the Cancer Type table
CREATE TABLE cancer_type (
 cancer_type_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 description VARCHAR(255),
 PRIMARY KEY (cancer_type_id)
);


-- Insert sample data into the Cancer Type table
INSERT INTO cancer_type (name, description) VALUES
 ('Prostate Cancer', 'A cancer that occurs in the prostate gland.'),
 ('Breast Cancer', 'A cancer that forms in the cells of the breasts.'),
 ('Lung Cancer', 'A cancer that forms in the tissues of the lungs.');


-- Create the User table
CREATE TABLE user (
 user_id INT NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 occupation VARCHAR(100) NOT NULL,
 birth_date DATE NOT NULL,
 gender VARCHAR(50) NOT NULL,
 city VARCHAR(100) NOT NULL,
 state VARCHAR(50) NOT NULL,
 cancer_type_id INT NOT NULL,
 email_1 VARCHAR(50) NOT NULL,
 email_2 VARCHAR(50),
 phone_1 VARCHAR(50) NOT NULL,
 phone_2 VARCHAR(50),
 PRIMARY KEY (user_id),
 FOREIGN KEY (cancer_type_id) REFERENCES cancer_type(cancer_type_id)
);


-- Insert sample data into the tables
INSERT INTO user (first_name, last_name, phone_1, email_1, city, state, cancer_type_id, birth_date, gender, occupation)
VALUES
('John', 'Smith', 1234567890, 'john.smith@gmail.com', 'Los Angeles', 'CA', 1, '1975-02-15', 'Male', 'Software Engineer'),
('Mary', 'Johnson', 1234567890, 'mary.johnson@yahoo.com', 'New York', 'NY', 2, '1982-08-12', 'Female', 'Nurse'),
('David', 'Lee', 1234567890, 'david.lee@hotmail.com', 'Chicago', 'IL', 3, '1968-04-22', 'Male', 'Business Owner'),
('Sarah', 'Kim', 1234567890, 'sarah.kim@gmail.com', 'Houston', 'TX', 2, '1990-10-30', 'Female', 'Marketing Manager');


-- Create the Treatment table
CREATE TABLE treatment(
 treatment_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 description VARCHAR(255),
 PRIMARY KEY (treatment_id)
);

-- Insert sample data into the Treatment table
INSERT INTO treatment (name, description) VALUES
 ('Surgery', 'A treatment that involves removing cancerous tissue through an operation.'),
 ('Chemotherapy', 'A treatment that uses drugs to kill cancer cells.'),
 ('Radiation Therapy', 'A treatment that uses high-energy radiation to shrink tumors and kill cancer cells.');

-- Create the Support Group Leader table
CREATE TABLE support_group_leader (
 group_leader_id INT NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL,
 PRIMARY KEY (group_leader_id)
);

INSERT INTO support_group_leader (first_name, last_name, email) VALUES ('John', 'Doe', 'john.doe@example.com');
INSERT INTO support_group_leader (first_name, last_name, email) VALUES ('Amy', 'Smith', 'amy.smith@example.com');
INSERT INTO support_group_leader (first_name, last_name, email) VALUES ('Jane', 'Doe', 'jane.doe@example.com');
INSERT INTO support_group_leader (first_name, last_name, email) VALUES ('Bob', 'Doe', 'bob.doe@example.com');

-- Create the Support Group table
CREATE TABLE support_group (
 support_group_id INT NOT NULL AUTO_INCREMENT,
 group_leader_id INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 location VARCHAR(50),
 capacity INT,
 PRIMARY KEY (support_group_id),
 FOREIGN KEY (group_leader_id) REFERENCES support_group_leader(group_leader_id)
);

-- Insert sample data into the Support Groups table
INSERT INTO support_group (group_leader_id, name, location, capacity) VALUES
 (1, 'Prostate Cancer Support Group', 'New York City', 20),
 (2, 'Breast Cancer Survivor Group', 'Los Angeles', 15),
 (3, 'Lung Cancer Awareness Group', 'Chicago', 10);

-- Create the Support Resource table
CREATE TABLE support_resource (
 resource_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 organization VARCHAR(50),
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(50),
 support_group_id INT,
 PRIMARY KEY (resource_id),
 FOREIGN KEY (support_group_id) REFERENCES support_group(support_group_id)
);

-- Insert sample data into the Support Resource table
INSERT INTO support_resource (name, organization, first_name, last_name, email, support_group_id) VALUES
 ('Counseling Services', 'ABC Foundation', 'John', 'Smith', 'john@abcfoundation.org', 1),
 ('Financial Assistance Programs', 'XYZ Association', 'Sarah', 'Johnson', 'sarah@xyzassociation.org', null),
 ('Educational Materials', 'Cancer Society', 'Alice', 'Brown', 'alice@cancersociety.org', 3);

-- Create the Symptom table
CREATE TABLE symptom (
symptom_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
description VARCHAR(500) NOT NULL,
PRIMARY KEY (symptom_id)
);

-- Insert sample data into the Symptom table
INSERT INTO symptom (name, description)
VALUES
    ('Extreme Fatigue', 'Extreme fatigue that does not get better with rest can be an early sign of cancer.
Cancer uses nutrients to grow and advance, so those nutrients are no longer replenishing your body.
This nutrient theft can make you feel extremely tired.'),
    ('Unexplained Weight Loss', 'Unexplained weight loss is characterized by a dramatic amount of weight loss without the person changing their lifestyle.
Typically, losing 10 pounds or more with no change in lifestyle is a sign of extreme weight loss and should spur
a talk with your physician. Unexplained weight loss is associated with cancers of the esophagus, stomach, lung, or pancreas.');

-- Create the Exhibits table
CREATE TABLE exhibits (
user_id INT NOT NULL,
symptom_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE,
severity VARCHAR(50),
PRIMARY KEY (symptom_id),
FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Insert sample data into the Exhibits table ** should symptom ID really be a primary key?
INSERT INTO exhibits (user_id, symptom_id, start_date, end_date, severity)
VALUES
(2, 1, '2023-02-20', '2023-03-05', 'severe'),
(3, 2, '2023-03-15', NULL, 'moderate');
-- (1, 3, '2023-03-01', NULL, 'mild');

-- Create the Typically Exhibits table
CREATE TABLE typically_exhibits (
symptom_id INT NOT NULL,
cancer_type_id INT NOT NULL,
PRIMARY KEY (symptom_id),
FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id),
FOREIGN KEY (cancer_type_id) REFERENCES user(cancer_type_id)
);

-- Insert sample data into the Typically Exhibits table
INSERT INTO typically_exhibits
VALUES
(2, 2),
(1, 1);

-- Create the Typically Treated With table
CREATE TABLE typically_treated_with(
 cancer_type_id INT NOT NULL,
 treatment_id INT NOT NULL,
 PRIMARY KEY (cancer_type_id, treatment_id),
 FOREIGN KEY (cancer_type_id) REFERENCES cancer_type(cancer_type_id),
 FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

-- Insert sample data into the Typically Treated With table
INSERT INTO typically_treated_with (cancer_type_id, treatment_id) VALUES
 (3, 3),
 (1, 2),
 (2, 1);

-- Create the Makes Connection table
CREATE TABLE makes_connection (
user_id_1 INT NOT NULL,
user_id_2 INT NOT NULL,
relationship VARCHAR(100) NOT NULL,
FOREIGN KEY (user_id_1) REFERENCES user(user_id) ON DELETE CASCADE,
FOREIGN KEY (user_id_2) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Insert sample data into the Makes Connection table
INSERT INTO makes_connection (user_id_1, user_id_2, relationship)
VALUES
(1, 2, 'Friend'),
(2, 3, 'Family'),
(3, 1, 'Support group');


-- Create the Medical Professional table
CREATE TABLE medical_professional (
professional_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
specialty VARCHAR(100) NOT NULL,
treatment_id INT,
PRIMARY KEY (professional_id),
FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

-- Insert sample data into the Medical Professionals table
INSERT INTO medical_professional (first_name, last_name, specialty, treatment_id)
VALUES
('Emily', 'Wang', 'Oncologist', 1),
('John', 'Smith', 'Radiologist', 2);

--  'https://www.mskcc.org/cancer-care/doctors/emily-wang', 'emily.wang@mskcc.org'),
-- ('John', 'Smith', 'Radiologist', 2, 'Rochester, MN', 'https://www.mayoclinic.org/biographies/smith-john-t-md/bio-20055452', 'john.smith@mayoclinic.org');


-- Create the Treatment Center table
CREATE TABLE treatment_center (
center_id INT NOT NULL AUTO_INCREMENT,
street_address VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
zip_code VARCHAR(10) NOT NULL,
website VARCHAR(100),
professional_id INT,
email_1 VARCHAR(50) NOT NULL,
email_2 VARCHAR(50),
phone_1 VARCHAR(50) NOT NULL,
phone_2 VARCHAR(50),
PRIMARY KEY (center_id),
FOREIGN KEY (professional_id) REFERENCES medical_professional(professional_id)
);

-- Insert sample data into the Treatment Center table
INSERT INTO treatment_center (street_address, state, city, zip_code, website, professional_id, email_1, phone_1)
VALUES
('1275 York Ave', 'New York', 'NY', '10065', 'https://www.mskcc.org/', 1, 'contact@mskcc.org', '(212) 639-2000'),
('200 1st St SW', 'Rochester', 'MN', '55905', 'https://www.mayoclinic.org/', 2, 'mayoclinic@mayoclinic.org', '+1 (507) 284-2511');

-- ('Johns Hopkins Hospital', '1800 Orleans St, Baltimore, MD 21287', '+1 (410) 955-5000', 'jhmi@jhmi.edu', 'https://www.hopkinsmedicine.org/');


-- Create the Medication table
CREATE TABLE medication (
medication_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
description VARCHAR(500),
PRIMARY KEY (medication_id)
);

-- Insert sample data into the Medication table
INSERT INTO medication (name, description)
VALUES
('Abemaciclib',
 'Abemaciclib is in a class of medications called kinase inhibitors.
 It works by blocking the action of an abnormal protein that signals
 cancer cells to multiply. This helps slow or stop the spread of cancer cells.'),
('Cisplatin',
 'Cisplatin is a chemotherapy drug. You might have it as a treatment for a number of different types of cancer.
 You might have cisplatin on its own or in combination with other cancer drugs or radiotherapy.'),
('Modafinil',
 'Modafinil is a medication used to treat narcolepsy. In cancer patients, it was found to help those with severe fatigue, but not mild or moderate levels of fatigue.
 There are side effects to these medications such as loss of appetite, sleep problems, dizziness, headache, and nausea.')

-- Create the Symptom Treated With table
CREATE TABLE symptom_treated_with (
symptom_id INT NOT NULL,
medication_id INT NOT NULL,
PRIMARY KEY (symptom_id, medication_id),
FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id),
FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- Insert sample data into the Symptom Treated With table
INSERT INTO symptom_treated_with (symptom_id, medication_id)
VALUES
(1, 3);

-- Create the Involves table
CREATE TABLE involves (
treatment_id INT NOT NULL,
medication_id INT NOT NULL,
PRIMARY KEY (treatment_id, medication_id),
FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id),
FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- Insert sample data into the Involves table
INSERT INTO involves (treatment_id, medication_id)
VALUES
(2, 2);

-- Create the Member Of table
CREATE TABLE member_of (
support_group_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (support_group_id, user_id),
FOREIGN KEY (support_group_id) REFERENCES support_group(support_group_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Insert sample data into the Member Of table
INSERT INTO member_of (support_group_id, user_id)
VALUES
(1, 1);

-- Create the Supported By table
CREATE TABLE supported_by (
resource_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (resource_id, user_id),
FOREIGN KEY (resource_id) REFERENCES support_resource(resource_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Insert sample data into the Supported By table
INSERT INTO supported_by (resource_id, user_id)
VALUES
(1, 3);

-- Create the Meeting table
CREATE TABLE meeting (
meeting_number INT NOT NULL AUTO_INCREMENT,
support_group_id INT NOT NULL,
PRIMARY KEY (meeting_number, support_group_id),
FOREIGN KEY (support_group_id) REFERENCES support_group(support_group_id)
);

-- Insert sample data into the Meeting table
INSERT INTO meeting (support_group_id)
VALUES
(3),
(2);






-- Create the Meeting table


# INSERT INTO cancer_type (name, description)
# VALUES
# ('Breast Cancer', 'Cancer that forms in the cells of the breasts.'),
# ('Prostate Cancer', 'Cancer that occurs in the prostate — a small walnut-shaped gland in men that produces the seminal fluid that nourishes and transports sperm.'),
# ('Lung Cancer', 'Cancer that forms in tissues of the lung, usually in the cells lining air passages.'),
# ('Colon Cancer', 'Cancer that occurs in the colon or rectum.');
#
# INSERT INTO treatment_option (name, description, cancer_type_id)
# VALUES
# ('Chemotherapy', 'Uses drugs to destroy cancer cells.', 1),
# ('Radiation Therapy', 'Uses high-energy radiation to kill cancer cells.', 2),
# ('Surgery', 'Involves removing the tumor and surrounding tissue during an operation.', 3);
#
#
# INSERT INTO support_resource (name, organization, contact_person, contact_email, cancer_type_id)
# VALUES
# ('Counseling Services', 'American Cancer Society', 'John Smith', 'john.smith@cancer.org', 1),
# ('Financial Assistance Programs', 'National Cancer Institute', 'Mary Johnson', 'mary.johnson@nci.gov', 2),
# ('Educational Materials', 'American Lung Association', 'David Lee', 'david.lee@lung.org', 3),
# ('Support Groups', 'Susan G. Komen', 'Sarah Kim', 'sarah.kim@komen.org', 1);
#
#
# INSERT INTO support_group (group_leader_id, name, cancer_type_id, location, frequency, capacity)
# VALUES
# (1, 'Breast Cancer Support Group', 1, 'Los Angeles, CA', 'Monthly', 20),
# (2, 'Prostate Cancer Support Group', 2, 'New York, NY', 'Weekly', 15),
# (3, 'Lung Cancer Support Group', 3, 'Chicago, IL', 'Bi-weekly', 10),
# (4, 'Breast Cancer Survivors Support Group', 1, 'Houston, TX', 'Monthly', 30);
#
#
# INSERT INTO support_group_leader (first_name, last_name, email)
# VALUES
# ('Emily', 'Smith', 'emily.smith@gmail.com'),
# ('Ryan', 'Johnson', 'ryan.johnson@yahoo.com'),
# ('Jessica', 'Lee', 'jessica.lee@hotmail.com');
#
#
# -- Insert sample data into the Symptom table
# INSERT INTO symptom (user_id, severity, start_date, end_date, cancer_type_id)
# VALUES
# (1, 'moderate', '2023-03-15', NULL, 3),
# (2, 'severe', '2023-02-20', '2023-03-05', 2),
# (3, 'mild', '2023-03-01', NULL, 1);
#
#
# -- Insert sample data into the Treatment table
# INSERT INTO treatment (user_id, treatment_id, start_date, end_date)
# VALUES
# (1, 1, '2023-03-01', NULL),
# (2, 2, '2023-02-15', '2023-03-30'),
# (3, 3, '2023-03-01', NULL);
#
#
#
#
# -- Insert sample data into the Treatment Centers table
# INSERT INTO treatment_center (name, address, phone_number, email, website)
# VALUES
# ('Memorial Sloan Kettering Cancer Center', '1275 York Ave, New York, NY 10065', '+1 (212) 639-2000', 'contact@mskcc.org', 'https://www.mskcc.org/'),
# ('Mayo Clinic', '200 1st St SW, Rochester, MN 55905', '+1 (507) 284-2511', 'mayoclinic@mayoclinic.org', 'https://www.mayoclinic.org/'),
# ('Johns Hopkins Hospital', '1800 Orleans St, Baltimore, MD 21287', '+1 (410) 955-5000', 'jhmi@jhmi.edu', 'https://www.hopkinsmedicine.org/');
#
#
#
#
# -- Insert sample data into the Community Forum Posts table
# INSERT INTO community_forum_post (user_id, title, tag)
# VALUES
# (1, 'Dealing with fatigue during treatment', 'fatigue'),
# (2, 'Tips for managing chemo-induced nausea', 'nausea'),
# (3, 'Looking for recommendations for support groups in the Chicago area', 'support groups'),
# (4, 'Sharing my experience with radiation therapy', 'radiation'),
# (5, 'Coping with anxiety after a cancer diagnosis', 'anxiety');
#
#
#
