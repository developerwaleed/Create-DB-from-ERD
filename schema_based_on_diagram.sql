CREATE DATABASE clinic;

CREATE TABLE medical_histories 
( id INT GENERATED ALWAYS AS IDENTITY, 
    admitted_at TIMESTAMP,  
    patient_id INT INT REFERENCES patients(id), 
    status VARCHAR(250),
    PRIMARY KEY(id));

CREATE TABLE patients 
( id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(250),
    date_of_birth DATE, 
    PRIMARY KEY(id));

CREATE TABLE invoices 
( id INT GENERATED ALWAYS AS IDENTITY, 
    total_amount decimal(10,2),
    generated_at TIMESTAMP,  
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY(id));

CREATE TABLE treatments 
( id INT GENERATED ALWAYS AS IDENTITY, 
    type VARCHAR(250),
    name VARCHAR(250), 
    PRIMARY KEY(id));

CREATE TABLE invoice_items 
( id INT GENERATED ALWAYS AS IDENTITY, 
    unit_price decimal(10,2),
    quantity INT,
    total_price decimal(10,2),
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(id));

CREATE TABLE treatments_histories(
  treatment_id INT REFERENCES treatments(id),
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(treatment_id, medical_history_id)
);

CREATE INDEX medical_histories_patient ON medical_histories (patient_id);
CREATE INDEX invoice_medical_history ON invoices (medical_history_id);
CREATE INDEX invoice_items_invoice ON invoice_items (invoice_id);
CREATE INDEX invoice_items_treatment ON invoice_items (treatment_id);
CREATE INDEX treatments_medical_histories_medical_history ON treatments_histories (medical_history_id);
CREATE INDEX treatments_medical_histories_treatment ON treatments_histories (treatment_id);