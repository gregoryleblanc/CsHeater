This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all for the Analog Output Functions.  Instance 2 starts at 920.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description         |
| ------- | ------ | ------------- | ------------ | ------------------------ |
| 840     | 0      | uint          |              | Type                     |
| 842     | 2      | uint          |              | Function                 |
| 844     | 4      | uint          |              | Retransmit Source        |
| 846     | 6      | uint          |              | Function Instance        |
| 848     | 8      | float         |              | Electrical Output Offset |
| 850     | 10     | float         |              | Electrical Output Slope  |
| 852     | 12     | float         |              | Calibration Offset       |
| 854     | 14     |               |              |                          |
| 856     | 16     | float         |              | Scale Low                |
| 858     | 18     | float         |              | Scale High               |
| 860     | 20     | float         |              | Range Low                |
| 862     | 22     | float         |              | Range High               |
| 864     | 24     |               |              |                          |
