ALTER TABLE job_applied
ADD contact VARCHAR(50); -- Agregué columna, aunque no tiene data

UPDATE job_applied -- Modifico valores de columna que creé
SET    contact = 'Erlich Bachman'
WHERE   job_id = 1;

UPDATE job_applied
SET    contact = 'Dinesh Chugtai'
WHERE   job_id = 2;

SELECT *
FROM job_applied
;

/* Quiero renombrar la columna que hice */
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

/* Quiero cambiar el datatype de la columna */
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;