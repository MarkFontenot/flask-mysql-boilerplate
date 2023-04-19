SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- Create the database
DROP SCHEMA IF EXISTS cancer_patient_platform;
CREATE SCHEMA IF NOT EXISTS cancer_patient_platform;

-- Use the database
USE cancer_patient_platform;

-- Create the Cancer Type table
CREATE TABLE cancer_type (
 cancer_type_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(500) NOT NULL,
 description VARCHAR(500),
 PRIMARY KEY (cancer_type_id)
);

-- Create the User table
CREATE TABLE user (
 user_id INT NOT NULL AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 occupation VARCHAR(500) NOT NULL,
 birth_date DATE NOT NULL,
 gender VARCHAR(50) NOT NULL,
 city VARCHAR(100) NOT NULL,
 state VARCHAR(50) NOT NULL,
 cancer_type_id INT,
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
 description VARCHAR(500),
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
 name VARCHAR(500) NOT NULL,
 location VARCHAR(100),
 capacity INT,
 PRIMARY KEY (support_group_id),
 FOREIGN KEY (group_leader_id) REFERENCES support_group_leader(group_leader_id)
);

-- Create the Support Resource table
CREATE TABLE support_resource (
 resource_id INT NOT NULL AUTO_INCREMENT,
 name VARCHAR(500) NOT NULL,
 organization VARCHAR(500),
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
name VARCHAR(500) NOT NULL,
description VARCHAR(500) NOT NULL,
PRIMARY KEY (symptom_id)
);

-- Create the Exhibits table
CREATE TABLE exhibits (
user_id INT NOT NULL,
symptom_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE,
severity VARCHAR(500),
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
relationship VARCHAR(500) NOT NULL,
FOREIGN KEY (user_id_1) REFERENCES user(user_id) ON DELETE CASCADE,
FOREIGN KEY (user_id_2) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Create the Medical Professional table
CREATE TABLE medical_professional (
professional_id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
specialty VARCHAR(500) NOT NULL,
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
name VARCHAR(500) NOT NULL,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;