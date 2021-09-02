This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all for the Process Functions.  Instance 2 starts at 3380.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description    |
| ------- | ------ | ------------- | ------------ | ------------------- |
| 3310    | 0      | float         |              | Source Value A      |
| 3312    | 2      | float         |              | Source Value B      |
| 3314    | 4      |               |              |                     |
| 3316    | 6      |               |              |                     |
| 3318    | 8      |               |              |                     |
| 3320    | 10     | uint          |              | Function            |
| 3322    | 12     | float         |              | Output Value        |
| 3324    | 14     | float         |              | Offset              |
| 3326    | 16     | float         |              | Filter Time         |
| 3328    | 18     | uint          |              | Output Error        |
| 3330    | 20     | uint          |              | Pressure Units      |
| 3332    | 22     | uint          |              | Altitude Units      |
| 3334    | 24     | float         |              | Barometric Pressure |
| 3336    |        |               |              |                     |
|         |        |               |              |                     |