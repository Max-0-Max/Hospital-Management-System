  CREATE TABLE "MAXWELL_APPOINTMENTS" 
   (	"APPOINTMENT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"PATIENT_ID" NUMBER, 
	"DOCTOR_ID" NUMBER, 
	"APPOINTMENT_DATE" DATE, 
	"STATUS" VARCHAR2(20), 
	"NOTES" VARCHAR2(500), 
	 PRIMARY KEY ("APPOINTMENT_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "MAXWELL_DOCTORS" 
   (	"DOCTOR_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"NAME" VARCHAR2(100), 
	"SPECIALTY" VARCHAR2(100), 
	"PHONE" VARCHAR2(200), 
	 PRIMARY KEY ("DOCTOR_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "MAXWELL_PATIENTS" 
   (	"PATIENT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"NAME" VARCHAR2(100), 
	"AGE" NUMBER, 
	"GENDER" VARCHAR2(200), 
	"PHONE" VARCHAR2(20), 
	"EMAIL" VARCHAR2(100), 
	"ADDRESS" VARCHAR2(255), 
	 PRIMARY KEY ("PATIENT_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "MAXWELL_PAYMENTS" 
   (	"PAYMENT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"APPOINTMENT_ID" NUMBER, 
	"AMOUNT" NUMBER(10,2), 
	"PAYMENT_TYPE" VARCHAR2(20), 
	"PAYMENT_METHOD" VARCHAR2(20), 
	"PAYMENT_DATE" DATE, 
	"PATIENT_ID" NUMBER, 
	 CHECK (PAYMENT_TYPE IN ('Consultation', 'Treatment', 'Drug')) ENABLE, 
	 CHECK (PAYMENT_METHOD IN ('Cash', 'Card', 'Insurance', 'Online')) ENABLE, 
	 PRIMARY KEY ("PAYMENT_ID")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "MAXWELL_PRESCRIPTIONS" 
   (	"PRESCRIPTION_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE, 
	"APPOINTMENT_ID" NUMBER, 
	"DRUG_NAME" VARCHAR2(100), 
	"DOSAGE" VARCHAR2(50), 
	"DURATION" VARCHAR2(50), 
	 PRIMARY KEY ("PRESCRIPTION_ID")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "MAXWELL_APPOINTMENTS" ADD CONSTRAINT "FK_APPT_PATIENT" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "MAXWELL_PATIENTS" ("PATIENT_ID") ENABLE;
  ALTER TABLE "MAXWELL_APPOINTMENTS" ADD CONSTRAINT "FK_APPT_DOCTOR" FOREIGN KEY ("DOCTOR_ID")
	  REFERENCES "MAXWELL_DOCTORS" ("DOCTOR_ID") ENABLE;

  ALTER TABLE "MAXWELL_PAYMENTS" ADD CONSTRAINT "FK_PAY_APPT" FOREIGN KEY ("APPOINTMENT_ID")
	  REFERENCES "MAXWELL_APPOINTMENTS" ("APPOINTMENT_ID") ENABLE;
  ALTER TABLE "MAXWELL_PAYMENTS" ADD CONSTRAINT "FK_PATIENT_ID" FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "MAXWELL_PATIENTS" ("PATIENT_ID") ENABLE;

  ALTER TABLE "MAXWELL_PRESCRIPTIONS" ADD CONSTRAINT "FK_PRESC_APPT" FOREIGN KEY ("APPOINTMENT_ID")
	  REFERENCES "MAXWELL_APPOINTMENTS" ("APPOINTMENT_ID") ENABLE;






















 