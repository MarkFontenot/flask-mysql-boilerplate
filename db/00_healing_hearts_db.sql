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

-- Create the Treatment table
CREATE TABLE treatment(
 treatment_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 description VARCHAR(255),
 PRIMARY KEY (treatment_id)
);

-- Create the Support Group Leader table
CREATE TABLE support_group_leader (
 group_leader_id INT NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL,
 PRIMARY KEY (group_leader_id)
);

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

-- Create the Symptom table
CREATE TABLE symptom (
symptom_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
description VARCHAR(500) NOT NULL,
PRIMARY KEY (symptom_id)
);

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

-- Create the Typically Exhibits table
CREATE TABLE typically_exhibits (
symptom_id INT NOT NULL,
cancer_type_id INT NOT NULL,
PRIMARY KEY (symptom_id),
FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id),
FOREIGN KEY (cancer_type_id) REFERENCES user(cancer_type_id)
);

-- Create the Typically Treated With table
CREATE TABLE typically_treated_with(
 cancer_type_id INT NOT NULL,
 treatment_id INT NOT NULL,
 PRIMARY KEY (cancer_type_id, treatment_id),
 FOREIGN KEY (cancer_type_id) REFERENCES cancer_type(cancer_type_id),
 FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

-- Create the Makes Connection table
CREATE TABLE makes_connection (
user_id_1 INT NOT NULL,
user_id_2 INT NOT NULL,
relationship VARCHAR(100) NOT NULL,
FOREIGN KEY (user_id_1) REFERENCES user(user_id) ON DELETE CASCADE,
FOREIGN KEY (user_id_2) REFERENCES user(user_id) ON DELETE CASCADE
);

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

-- Create the Medication table
CREATE TABLE medication (
medication_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
description VARCHAR(500),
PRIMARY KEY (medication_id)
);

-- Create the Symptom Treated With table
CREATE TABLE symptom_treated_with (
symptom_id INT NOT NULL,
medication_id INT NOT NULL,
PRIMARY KEY (symptom_id, medication_id),
FOREIGN KEY (symptom_id) REFERENCES symptom(symptom_id),
FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- Create the Involves table
CREATE TABLE involves (
treatment_id INT NOT NULL,
medication_id INT NOT NULL,
PRIMARY KEY (treatment_id, medication_id),
FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id),
FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- Create the Member Of table
CREATE TABLE member_of (
support_group_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (support_group_id, user_id),
FOREIGN KEY (support_group_id) REFERENCES support_group(support_group_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create the Supported By table
CREATE TABLE supported_by (
resource_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (resource_id, user_id),
FOREIGN KEY (resource_id) REFERENCES support_resource(resource_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);


-- Create the Meeting table
CREATE TABLE meeting (
meeting_number INT NOT NULL AUTO_INCREMENT,
support_group_id INT NOT NULL,
PRIMARY KEY (meeting_number, support_group_id),
FOREIGN KEY (support_group_id) REFERENCES support_group(support_group_id)
);






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
