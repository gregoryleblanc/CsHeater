This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all for the Control Loop Functions.  Control Loop 2 starts at 2430.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description           |
| ------- | ------ | ------------- | ------------ | -------------------------- |
| 2360    | 0      | uint          |              | Control Mode               |
| 2362    | 2      | uint          |              | Control Mode Active        |
| 2364    | 4      | uint          |              | Heat Algorithm             |
| 2366    | 6      | uint          |              | Cool Algorithm             |
| 2368    | 8      | uint          |              | Cool Output Curve          |
| 2370    | 10     | float         |              | Heat Proportional Band     |
| 2372    | 12     | float         |              | Cool Proportional Band     |
| 2374    | 14     | float         |              | Time Integral              |
| 2376    | 16     | float         |              | Time Derivative            |
| 2378    | 18     | float         |              | Dead Band                  |
| 2380    | 20     | float         |              | On/Off Heat Hysteresis     |
| 2382    | 22     | float         |              | On/Off Cool Hysteresis     |
| 2384    | 24     | float         |              | Heat Power                 |
| 2386    | 26     | float         |              | Cool Power                 |
| 2388    | 28     | float         |              | Output Power               |
| 2390    | 30     | uint          |              | TRU-TUNE+® Enable          |
| 2392    | 32     | uint          |              | TRU-TUNE+® Band            |
| 2394    | 34     | uint          |              | TRU-TUNE+® Gain            |
| 2396    | 36     | uint          |              | Autotune Aggressiveness    |
| 2398    | 38     | float         |              | Autotune Setpoint          |
| 2400    | 40     | uint          |              | Autoune Enable             |
| 2402    | 42     | uint          |              | Open Loop Detect Enable    |
| 2404    | 44     | uint          |              | Open Loop Detect Time      |
| 2406    | 46     | float         |              | Open Loop Detect Deviation |
| 2408    | 48     | uint          |              | Loop Error                 |
| 2410    | 50     | uint          |              | Clear Loop Error           |
| 2412    | 52     | uint          |              | Autotune Status            |
| 2414    | 54     | uint          |              | Peltier Delay              |
| 2416    | 56     |               |              |                            |
| 2418    | 58     |               |              |                            |
| 2420    | 60     |               |              |                            |
| 2422    | 62     |               |              |                            |
| 2424    | 64     |               |              |                            |
| 2426    | 66     |               |              |                            |
| 2428    | 68     |               |              |                            |
