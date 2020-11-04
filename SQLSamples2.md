# SQL Samples (2)

## A. CREATE TABLE

### Test Table

    CREATE TABLE testTable (
      date TIMESTAMP PRIMARY KEY,
      id INTEGER,
      alertLevel INTEGER,
      detail STRING
    ) USING TIMESERIES WITH (
      expiration_type='PARTITION',
      expiration_time=1,
      expiration_time_unit='DAY'
    ) PARTITION BY RANGE (date) EVERY (1, DAY); 

## B. INSERT

### Test Table

    INSERT INTO testTable VALUES(TIMESTAMP_ADD(DAY, NOW(), -2), -2, 1, 'xxx');
    INSERT INTO testTable VALUES(NOW(), 0, 1, 'xxx');
    INSERT INTO testTable VALUES(TIMESTAMP_ADD(DAY, NOW(), 1), 1, 2, 'xxx');
    INSERT INTO testTable VALUES(TIMESTAMP_ADD(DAY, NOW(), 2), 2, 1, 'xxx');
    INSERT INTO testTable VALUES(TIMESTAMP_ADD(DAY, NOW(), 3), 3, 2, 'xxx');

## C. SELECT

### ALL

    SELECT * FROM testTable;

### Partitioning information (Metatables)

    SELECT * FROM "#table_partitions" WHERE TABLE_NAME='testTable';

### EXPLAIN ANALYZE

    EXPLAIN ANALYZE SELECT * FROM testTable;
    EXPLAIN ANALYZE SELECT MAX(alertLevel) FROM testTable GROUP BY id;
