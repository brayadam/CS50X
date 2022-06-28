-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT description
FROM crime_scene_reports
WHERE month = 7 and DAY = 28
AND street = "Humphrey Street";
--3 witnesses

SELECT transcript
FROM interviews
WHERE month = 7 AND day = 28;
--Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away.
--If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.
--Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.
--As the thief was leaving the bakery, they called someone who talked to them for less than a minute.
--In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow.
--The thief then asked the person on the other end of the phone to purchase the flight ticket.


SELECT license_plate, hour, minute
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10;
+---------------+------+--------+
| license_plate | hour | minute |
+---------------+------+--------+
| R3G7486       | 10   | 8      |
| 13FNH73       | 10   | 14     |
| 5P2BI95       | 10   | 16     |
| 94KL13X       | 10   | 18     |
| 6P58WS2       | 10   | 18     |
| 4328GD8       | 10   | 19     |
| G412CB7       | 10   | 20     |
| L93JTIZ       | 10   | 21     |
| 322W7JE       | 10   | 23     |
| 0NTHK55       | 10   | 23     |
| 1106N58       | 10   | 35     |
| NRYN856       | 10   | 42     |
| WD5M8I6       | 10   | 44     |
| V47T75I       | 10   | 55     |
+---------------+------+--------+

SELECT caller, receiver, duration
FROM phone_calls
WHERE month = 7 AND day = 28
AND duration < 60;
+----------------+----------------+----------+
|     caller     |    receiver    | duration |
+----------------+----------------+----------+
| (130) 555-0289 | (996) 555-8899 | 51       |
| (499) 555-9472 | (892) 555-8872 | 36       |
| (367) 555-5533 | (375) 555-8161 | 45       |
| (499) 555-9472 | (717) 555-1342 | 50       |
| (286) 555-6063 | (676) 555-6554 | 43       |
| (770) 555-1861 | (725) 555-3243 | 49       |
| (031) 555-6622 | (910) 555-3251 | 38       |
| (826) 555-1652 | (066) 555-9701 | 55       |
| (338) 555-6650 | (704) 555-2131 | 54       |
+----------------+----------------+----------+

SELECT account_number, amount, transaction_type
FROM atm_transactions
WHERE atm_location = "Leggett Street"
AND month = 7 AND day = 28;
+----------------+--------+------------------+
| account_number | amount | transaction_type |
+----------------+--------+------------------+
| 28500762       | 48     | withdraw         |
| 28296815       | 20     | withdraw         |
| 76054385       | 60     | withdraw         |
| 49610011       | 50     | withdraw         |
| 16153065       | 80     | withdraw         |
| 86363979       | 10     | deposit          |
| 25506511       | 20     | withdraw         |
| 81061156       | 30     | withdraw         |
| 26013199       | 35     | withdraw         |
+----------------+--------+------------------+

SELECT name, phone_number, license_plate
FROM people
WHERE license_plate
IN (SELECT license_plate
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10);
+---------+----------------+---------------+
|  name   |  phone_number  | license_plate |
+---------+----------------+---------------+
| Vanessa | (725) 555-4692 | 5P2BI95       |
| Barry   | (301) 555-4174 | 6P58WS2       |
| Brandon | (771) 555-6667 | R3G7486       |
| Iman    | (829) 555-5269 | L93JTIZ       |
| Sofia   | (130) 555-0289 | G412CB7       |
| Taylor  | (286) 555-6063 | 1106N58       |
| Luca    | (389) 555-5198 | 4328GD8       |
| Diana   | (770) 555-1861 | 322W7JE       |
| Kelsey  | (499) 555-9472 | 0NTHK55       |
| Denise  | (994) 555-3373 | NRYN856       |
| Thomas  | (286) 555-0131 | WD5M8I6       |
| Bruce   | (367) 555-5533 | 94KL13X       |
| Sophia  | (027) 555-1068 | 13FNH73       |
| Jeremy  | (194) 555-5027 | V47T75I       |
+---------+----------------+---------------+

SELECT *
FROM people
INNER JOIN bank_accounts
ON people.id = bank_accounts.person_id
WHERE license_plate
IN (SELECT license_plate FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10)
AND account_number
IN (SELECT account_number
FROM atm_transactions
WHERE atm_location = 'Leggett Street'
AND month = 7 AND day = 28)
AND phone_number
IN (SELECT caller
FROM phone_calls
WHERE month = 7 AND day = 28 AND duration < 60);
+--------+--------+----------------+-----------------+---------------+----------------+-----------+---------------+
|   id   |  name  |  phone_number  | passport_number | license_plate | account_number | person_id | creation_year |
+--------+--------+----------------+-----------------+---------------+----------------+-----------+---------------+
| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       | 49610011       | 686048    | 2010          |
| 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       | 26013199       | 514354    | 2012          |
| 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       | 76054385       | 449774    | 2015          |
+--------+--------+----------------+-----------------+---------------+----------------+-----------+---------------+

SELECT *
FROM flights
INNER JOIN passengers
ON flights.id = passengers.flight_id
WHERE passport_number = '5773159633'
OR passport_number = '3592750733'
OR passport_number = '1988161715';
+----+-------------------+------------------------+------+-------+-----+------+--------+-----------+-----------------+------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute | flight_id | passport_number | seat |
+----+-------------------+------------------------+------+-------+-----+------+--------+-----------+-----------------+------+
| 18 | 8                 | 6                      | 2021 | 7     | 29  | 16   | 0      | 18        | 3592750733      | 4C   |
| 24 | 7                 | 8                      | 2021 | 7     | 30  | 16   | 27     | 24        | 3592750733      | 2C   |
| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     | 36        | 5773159633      | 4A   |
| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     | 36        | 1988161715      | 6D   |
| 54 | 8                 | 5                      | 2021 | 7     | 30  | 10   | 19     | 54        | 3592750733      | 6C   |
+----+-------------------+------------------------+------+-------+-----+------+--------+-----------+-----------------+------+

SELECT *
FROM airports
WHERE city = 'Fiftyville';
+----+--------------+-----------------------------+------------+
| id | abbreviation |          full_name          |    city    |
+----+--------------+-----------------------------+------------+
| 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
+----+--------------+-----------------------------+------------+

SELECT *
FROM people
WHERE passport_number = '5773159633'
OR passport_number = '1988161715';
+--------+--------+----------------+-----------------+---------------+
|   id   |  name  |  phone_number  | passport_number | license_plate |
+--------+--------+----------------+-----------------+---------------+
| 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
| 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
+--------+--------+----------------+-----------------+---------------+
--At this point I have the search narrowed down to 2 suspects and I have the destination_airport_id

--Destination airport
SELECT *
FROM airports
WHERE id = 4;
+----+--------------+-------------------+---------------+
| id | abbreviation |     full_name     |     city      |
+----+--------------+-------------------+---------------+
| 4  | LGA          | LaGuardia Airport | New York City |
+----+--------------+-------------------+---------------+

--Bruce arrived at the bakery minutes before the robbery took place and Taylor arrived after the robbery had taken place so this leaves only Bruce as a suspect
SELECT license_plate, hour, minute
FROM bakery_security_logs
WHERE month = 7 AND day = 28 AND hour = 10;
+---------------+------+--------+
| license_plate | hour | minute |
+---------------+------+--------+
| R3G7486       | 10   | 8      |
| 13FNH73       | 10   | 14     |
| 5P2BI95       | 10   | 16     |
| 94KL13X       | 10   | 18     | <<- Bruce
| 6P58WS2       | 10   | 18     |
| 4328GD8       | 10   | 19     |
| G412CB7       | 10   | 20     |
| L93JTIZ       | 10   | 21     |
| 322W7JE       | 10   | 23     |
| 0NTHK55       | 10   | 23     |
| 1106N58       | 10   | 35     |<<- Taylor
| NRYN856       | 10   | 42     |
| WD5M8I6       | 10   | 44     |
| V47T75I       | 10   | 55     |
+---------------+------+--------+

--Bruce called (375) 555-8161 revealing the accomplice
SELECT *
FROM people
WHERE phone_number = '(375) 555-8161';
+--------+-------+----------------+-----------------+---------------+
|   id   | name  |  phone_number  | passport_number | license_plate |
+--------+-------+----------------+-----------------+---------------+
| 864400 | Robin | (375) 555-8161 |                 | 4V16VO0       |
+--------+-------+----------------+-----------------+---------------+