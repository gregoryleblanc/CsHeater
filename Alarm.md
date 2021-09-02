This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all here for Alarm 1.  These are mostly duplicate for alarms 2, 3, and 4 with an offset of +60 each.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description                      |
| ------- | ------ | ------------- | ------------ | ------------------------------------- |
| 1880    | 0      | float         |              | High Set Point (Alarm Type Dependant) |
| 1882    | 2      | float         |              | Low Set Point (Alarm Type Dependant)  |
| 1884    | 4      | float         |              | Alarm Hysteresis                      |
| 1886    | 6      | float         |              | Alarm Sides (both/low/high)           |
| 1888    | 8      | uint          |              | Alarm Logic (close/open on alarm)     |
| 1890    | 10     | uint          |              | Alarm Silencing Command               |
| 1892    | 12     | uint          |              | Alarm Latching                        |
| 1894    | 14     | uint          |              | Alarm Blocking                        |
| 1896    | 16     | uint          |              | Alarm State                           |
| 1898    | 18     | uint          |              | Alarm Latched (Y/N)                   |
| 1900    | 20     | uint          |              | Alarm Silenced (Y/N)                  |
| 1902    | 22     | uint          |              | Alarm Clearable (Y/N)                 |
| 1904    | 24     | uint          |              | Clear Alarm Command                   |
| 1906    | 26     | uint          |              | Silence Alarm Command                 |
| 1908    | 28     | uint          |              | Alarm Type                            |
| 1910    | 30     | uint          |              | Alarm Display                         |
| 1912    | 32     | uint          |              | Alarm Source                          |
| 1914    | 34     | uint          |              | Alarm Source Instance                 |
| 1916    | 36     |               |              |                                       |
| 1918    | 38     |               |              |                                       |
| 1920    | 40     | uint          |              | Alarm Delay Time                      |
| 1922    | 42     |               |              |                                       |
| 1924    | 44     | uint          |              | Alarm Control Loop                    |
| 1926    | 46     |               |              |                                       |