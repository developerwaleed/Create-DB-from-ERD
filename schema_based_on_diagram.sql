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


