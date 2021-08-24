| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description                               |
| ------- | ------ | ------------- | ------------ | ---------------------------------------------- |
| 360     | 0      | float         | INT32\_BE    | Process Value                                  |
| 362     | 2      | uint          | INT32\_BE    | Input Error                                    |
| 364     | 4      |               | INT32\_BE    |                                                |
| 366     | 6      |               | INT32\_BE    |                                                |
| 368     | 8      | uint          | INT32\_BE    | Sensor type                                    |
| 370     | 10     | uint          | INT32\_BE    | TC Linearization                               |
| 372     | 12     | uint          | INT32\_BE    | No. of RTD Leads                               |
| 374     | 14     |               | INT32\_BE    |                                                |
| 376     | 16     |               | INT32\_BE    |                                                |
| 378     | 18     | float         | INT32\_BE    | Electrical Input Offset                        |
| 380     | 20     | float         | INT32\_BE    | Electrical Input Slope                         |
| 382     | 22     | float         | INT32\_BE    | Calibration Offset                             |
| 384     | 24     |               | INT32\_BE    |                                                |
| 386     | 26     | float         | INT32\_BE    | Filter time                                    |
| 388     | 28     | float         | INT32\_BE    | Scale low                                      |
| 390     | 30     | float         | INT32\_BE    | Scale high                                     |
| 392     | 32     | float         | INT32\_BE    | Range low                                      |
| 394     | 34     | float         | INT32\_BE    | Range high                                     |
| 396     | 36     |               | INT32\_BE    |                                                |
| 398     | 38     | uint          | INT32\_BE    | Display precision                              |
| 400     | 40     | float         | INT32\_BE    | Electrical measurement                         |
| 402     | 42     | float         | INT32\_BE    | Process value active (filtered)                |
| 404     | 44     |               | INT32\_BE    |                                                |
| 406     | 46     |               | INT32\_BE    |                                                |
| 408     | 48     |               | INT32\_BE    |                                                |
| 410     | 50     |               | INT32\_BE    |                                                |
| 412     | 52     |               | INT32\_BE    |                                                |
| 414     | 54     | uint          | INT32\_BE    | Input Error Latching (On/Off)                  |
| 416     | 56     |               | INT32\_BE    |                                                |
| 418     | 58     | uint          | INT32\_BE    | Process Error Enterable                        |
| 420     | 60     |               | INT32\_BE    | Process Error Low Value (minimum before error) |
| 422     | 62     |               | INT32\_BE    |                                                |
