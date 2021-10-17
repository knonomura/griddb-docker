# SQL Samples

## A. CREATE TABLE

### Equipment Table

    CREATE TABLE equipTable (
      id INTEGER PRIMARY KEY,
      type STRING,
      floor INTEGER,
      room_no INTEGER
    );

### Sensor Table

    CREATE TABLE sensorTable (
      date TIMESTAMP,
      id INTEGER,
      value DOUBLE,
      PRIMARY KEY(date, id)
    ) WITH (
      expiration_type='PARTITION',
      expiration_time=60,
      expiration_time_unit='DAY'
    ) PARTITION BY RANGE (date) EVERY (30, DAY)
    SUBPARTITION BY HASH (id) SUBPARTITIONS 6;

## B. INSERT

### Equipment Table

    INSERT INTO equipTable VALUES(1, 'CAMERA', 1, 1);
    INSERT INTO equipTable VALUES(2, 'THERMO', 1, 1);
    INSERT INTO equipTable VALUES(3, 'THERMO', 4, 3);
    INSERT INTO equipTable VALUES(4, 'THERMO', 6, 2);
    INSERT INTO equipTable VALUES(5, 'WATT', 1, 1);
    INSERT INTO equipTable VALUES(6, 'WATT', 6, 1);

### Sensor Table

    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T10:30:00Z'), 2, 18.5);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T10:30:00Z'), 3, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T10:30:00Z'), 4, 22.5);

    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:00:00Z'), 2, 19.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:00:00Z'), 3, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:00:00Z'), 4, 22.5);

    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:30:00Z'), 2, 19.5);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:30:00Z'), 3, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T11:30:00Z'), 4, 22.0);

    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:00:00Z'), 2, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:00:00Z'), 3, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:00:00Z'), 4, 22.0);

    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:30:00Z'), 2, 20.5);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:30:00Z'), 3, 20.0);
    INSERT INTO sensorTable VALUES(TIMESTAMP('2021-11-01T12:30:00Z'), 4, 22.5);

    NOTE:
    Please use the date when you try because expiration function is used for Sensor Table. 
    For example, if today is '2021-12-1', '2021-12-01T##:##:##Z'.

## C. SELECT

### ALL

    SELECT * FROM equipTable;
    SELECT * FROM sensorTable;

### JOIN

    SELECT equipTable.id, type, floor, room_no, min FROM equipTable JOIN 
      (SELECT id, MIN(value) AS min FROM sensorTable 
      WHERE date >= TIMESTAMP('2021-11-01T12:00:00Z') AND date < TIMESTAMP('2021-11-01T18:00:00Z') GROUP BY id) t 
      ON equipTable.id = t.id AND min >= 20.0;

    SELECT equipTable.id, type, floor, room_no, min FROM equipTable JOIN 
      (SELECT id, MIN(value) AS min FROM sensorTable GROUP BY id) t 
      ON equipTable.id = t.id AND min >= 20.0;

### ORDER BY CASE

    SELECT * FROM equipTable WHERE floor >= 3 ORDER BY CASE type
                            WHEN 'CAMERA' THEN 1
                            WHEN 'THERMO' THEN 2
                            WHEN  'WATT' THEN 3
                            WHEN  'AMP' THEN 4
                            ELSE 5
                            END;
