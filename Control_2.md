This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all for the Control Loop Functions.  Control Loop 2 starts at 2720.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description       |
| ------- | ------ | ------------- | ------------ | ---------------------- |
| 2640    | 0      | float         |              | Set Point              |
| 2642    | 2      | float         |              | Manual Power           |
| 2644    | 4      | float         |              | Minimum Set Point      |
| 2646    | 6      | float         |              | Maximum Set Point      |
| 2648    | 8      | float         |              | Minimum Manual Power   |
| 2650    | 10     | float         |              | Maximum Manual Power   |
| 2652    | 12     | float         |              | Set Point Active Value |
| 2654    | 14     | float         |              | Idle Set Point         |
| 2656    | 16     | float         |              | Fixed Power            |
| 2658    | 18     |               |              |                        |
| 2660    | 20     |               |              |                        |
| 2662    | 22     | uint          |              | Auto-to-Manual Power   |
| 2664    | 24     | uint          |              | Input Error Power      |
| 2666    | 26     | uint          |              | Ramp Action            |
| 2668    | 28     | uint          |              | Ramp Scale             |
| 2670    | 30     |               |              |                        |
| 2672    | 32     | uint          |              | Ramp Rate              |
| 2674    | 34     |               |              |                        |
| 2676    | 36     |               |              |                        |
| 2678    | 38     |               |              |                        |
| 2680    | 40     | uint          |              | Remote Set Point (Y/N) |
| 2682    | 42     | uint          |              | Remote Set Point Type  |
| 2684    | 44     | uint          |              | Source Function B      |
