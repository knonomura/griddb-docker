# SQL Samples

## A. CREATE TABLE

### Equipment Table

    CREATE TABLE equipTable (
      id INTEGER PRIMARY KEY,
      type STRING,
      floor INTEGER,
      room_no INTEGER
    );

### Alert Table

    CREATE TABLE alertTable (
      date TIMESTAMP PRIMARY KEY,
      id INTEGER,
      alertLevel INTEGER,
      detail STRING
    ) USING TIMESERIES WITH (
      expiration_type='PARTITION',
      expiration_time=60,
      expiration_time_unit='DAY'
    ) PARTITION BY RANGE (date) EVERY (30, DAY); 

## B. INSERT

### Equipment Table

    INSERT INTO equipTable VALUES(1, 'CAMERA', 1, 1);
    INSERT INTO equipTable VALUES(2, 'THERMO', 1, 1);
    INSERT INTO equipTable VALUES(3, 'THERMO', 4, 3);
    INSERT INTO equipTable VALUES(4, 'THERMO', 6, 2);
    INSERT INTO equipTable VALUES(5, 'WATT', 1, 1);
    INSERT INTO equipTable VALUES(6, 'WATT', 6, 1);

### Alert Table

    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-01T10:30:00Z'), 1, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-03T12:10:00Z'), 2, 2, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-04T08:40:00Z'), 3, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-04T14:30:00Z'), 4, 2, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T03:40:00Z'), 2, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T06:20:00Z'), 5, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T09:10:00Z'), 1, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T11:00:00Z'), 2, 3, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T14:50:00Z'), 1, 1, 'xxx');
    INSERT INTO alertTable VALUES(TIMESTAMP('2020-10-05T15:20:00Z'), 3, 1, 'xxx');

## C. SELECT

### ALL

    SELECT * FROM equipTable;
    SELECT * FROM alertTable;

### JOIN

    SELECT equipTable.id, type, floor, room_no, max FROM equipTable JOIN 
      (SELECT id, MAX(alertLevel) AS max FROM alertTable 
      WHERE date >= TIMESTAMP('2020-10-05T00:00:00Z') AND date < TIMESTAMP('2020-10-06T00:00:00Z') GROUP BY id) t 
      ON equipTable.id = t.id AND max > 1;

    SELECT equipTable.id, type, floor, room_no, max FROM equipTable JOIN 
      (SELECT id, MAX(alertLevel) AS max FROM alertTable GROUP BY id) t ON equipTable.id = t.id AND max > 1;

### ORDER BY CASE

    SELECT * FROM equipTable WHERE floor >= 3 ORDER BY CASE type
                            WHEN 'CAMERA' THEN 1
                            WHEN 'THERMO' THEN 2
                            WHEN  'WATT' THEN 3
                            WHEN  'AMP' THEN 4
                            ELSE 5
                            END;
