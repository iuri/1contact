ALTER TABLE mandats ADD COLUMN code varchar(255);
ALTER TABLE mandats ADD COLUMN type_of_transaction char(1);
ALTER TABLE mandats ADD COLUMN type_of_property char(1);
ALTER TABLE mandats ADD COLUMN file_p char(1);
ALTER TABLE mandats ADD COLUMN remarks1 text;
ALTER TABLE mandats ADD COLUMN remarks2 text;
ALTER TABLE mandats ADD COLUMN confirmation text;
ALTER TABLE mandats ADD COLUMN origin char(1);
ALTER TABLE mandats ADD COLUMN origin_other varchar(255);
ALTER TABLE mandats ADD COLUMN payment_p char(1);
ALTER TABLE mandats ADD COLUMN status char(1);
ALTER TABLE mandats ADD COLUMN link varchar(255);
ALTER TABLE mandats ADD COLUMN terms_conditions_p char(1);
