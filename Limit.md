This is the mapping of addresses to their various names and descriptions from the watlow manual.  The addresses are in the watlow manual, but the offsets are what are used when setting up the various .substitution files.
These are all for the Limits.


| Address | Offset | Type (Watlow) | Type (EPICS) | Name/Description                    |
| ------- | ------ | ------------- | ------------ | ----------------------------------- |
| 720     | 0      | uint          |              | Clear Limit                         |
| 722     | 2      | float         |              | Hysteresis                          |
| 724     | 4      | float         |              | Low Limit Set Point                 |
| 726     | 6      | float         |              | High Limit Set Point                |
| 728     | 8      | uint          |              | Sides                               |
| 730     | 10     | uint          |              | Limit State                         |
| 732     | 12     |               |              |                                     |
| 734     | 14     | uint          |              | Integrate With System               |
| 736     | 16     | float         |              | Maximum Set Point                   |
| 738     | 18     | float         |              | Minimum Set Point                   |
| 740     | 20     |               |              |                                     |
| 742     | 22     |               |              |                                     |
| 744     | 24     | uint          |              | Limit Status                        |
| 746     | 26     |               |              |                                     |
| 748     | 28     | uint          |              | Source Function A (source of reset) |
