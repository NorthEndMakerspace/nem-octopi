# OctoPrint Webhooks

There's a [plugin for OctoPrint that sends
webhooks](https://plugins.octoprint.org/plugins/webhooks/) when various events
occur. This could be used for machine usage tracking.

First let's check out a state diagram showing various printer control activities
both on the printer itself and on OctoPrint, then let's explore some example
webhook messages.

## State diagram for printer states

This diagram shows relevant webhook events that indicate the start of printer use, and the end of printer use.

[![](https://mermaid.ink/img/pako:eNqNVNtugjAYfhXyXy5qxLON8WIHs2RbNHqxZGMxFao0k5aUss0Z3321BaETl3EDfIf_SNmDzwMCCBKJJbmleCNwVP9oecxRV0AF8SXlzHmce8xgWuh4sJBYSDT1JZ8JyqQHDk6OpJBLrsBYgxUOrSairI8zyFJPKKNJSAIjXOdvlub57vp-On1AOsBSB8sNn2QVcv5uwL9caytPbvtPvjWm2zOfwUquGKcJWWIzxtHIDzn1yXicj_P16s2p18fVk7PJ05hO4csOLazuuvBeElmQFuk1UbbJs82ObWim3JDhrBaPkhvMfLJF2f2CyMqJnDkp1XMmzsvRujQip7IyvJS2gtDFV-ATta1UVDHF_g1pQlt1l1edBbrI5-FsgfWN2YswZi1XH8EvrhxMs1CDiIgI00Cd5P1R7YEMiRoTIPW4wqp78NhB6XAq-WLHfEBSpKQGaRwUBx_QGm8ThcaYvXBevJOASi6ezK9C_zG0BtAevgDVB42muvq91rA97HTbbqsGO0Bus99o9_tud-i6g1631e4cavCtw7qHHwK4fH0)](http://mermaid.live/edit#pako:eNqNVNtugjAYfhXyXy5qxLON8WIHs2RbNHqxZGMxFao0k5aUss0Z3321BaETl3EDfIf_SNmDzwMCCBKJJbmleCNwVP9oecxRV0AF8SXlzHmce8xgWuh4sJBYSDT1JZ8JyqQHDk6OpJBLrsBYgxUOrSairI8zyFJPKKNJSAIjXOdvlub57vp-On1AOsBSB8sNn2QVcv5uwL9caytPbvtPvjWm2zOfwUquGKcJWWIzxtHIDzn1yXicj_P16s2p18fVk7PJ05hO4csOLazuuvBeElmQFuk1UbbJs82ObWim3JDhrBaPkhvMfLJF2f2CyMqJnDkp1XMmzsvRujQip7IyvJS2gtDFV-ATta1UVDHF_g1pQlt1l1edBbrI5-FsgfWN2YswZi1XH8EvrhxMs1CDiIgI00Cd5P1R7YEMiRoTIPW4wqp78NhB6XAq-WLHfEBSpKQGaRwUBx_QGm8ThcaYvXBevJOASi6ezK9C_zG0BtAevgDVB42muvq91rA97HTbbqsGO0Bus99o9_tud-i6g1631e4cavCtw7qHHwK4fH0)

## Example webhook messages

Here are some key messages with real-world content.

### Print started in OctoPrint

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Started",
  "message": "Your print has started.",
  "extra": {
    "name": "cube_1.8n_0.4mm_PETG_235C.gcode",
    "path": "Calbration/cube_0.8n_0.4mm_PETG_235C.gcode",
    "origin": "local",
    "size": 85675,
    "owner": "mike",
    "user": "mike"
  },
  "state": {
    "text": "Printing",
    "flags": {
      "operational": "True",
      "printing": "True",
      "cancelling": "False",
      "pausing": "False",
      "resuming": "False",
      "finishing": "False",
      "closedOrError": "False",
      "error": "False",
      "paused": "False",
      "ready": "False",
      "sdReady": "True"
    },
    "error": ""
  },
  "job": {
    "file": {
      "name": "cube_0.8n_0.4mm_PETG_235C.gcode",
      "path": "Calbration/cube_0.8n_0.4mm_PETG_235C.gcode",
      "display": "cube_0.8n_0.4mm_PETG_235C.gcode",
      "origin": "local",
      "size": 85675,
      "date": 1660616550
    },
    "estimatedPrintTime": 859.9312829893596,
    "averagePrintTime": 1051.9797971350054,
    "lastPrintTime": 1051.9797971350054,
    "filament": {
      "tool0": {
        "length": 1853.3127900000088,
        "volume": 4.457739663242711
      }
    },
    "user": "mike"
  },
  "progress": {
    "completion": 12.256784359498104,
    "filepos": 10501,
    "printTime": 0,
    "printTimeLeft": 1051,
    "printTimeLeftOrigin": "average"
  },
  "currentZ": "None",
  "offsets": {},
  "meta": {
    "hash": "a82a304c4045f4e0b172397b5f4d4dc34a036a5f",
    "analysis": {
      "printingArea": {
        "maxX": 141.336,
        "maxY": 121.336,
        "maxZ": 25.1,
        "minX": 0.0,
        "minY": -3.0,
        "minZ": 0.0
      },
      "dimensions": {
        "depth": 124.336,
        "height": 25.1,
        "width": 141.336
      },
      "estimatedPrintTime": 859.9312829893596,
      "filament": {
        "tool0": {
          "length": 1853.3127900000088,
          "volume": 4.457739663242711
        }
      }
    },
    "history": [
      {
        "timestamp": 1660617819.5876584,
        "printTime": 1051.9797971350054,
        "success": "True",
        "printerProfile": "mk3splus2"
      }
    ],
    "statistics": {
      "averagePrintTime": {
        "mk3splus2": 1051.9797971350054
      },
      "lastPrintTime": {
        "mk3splus2": 1051.9797971350054
      }
    }
  },
  "currentTime": 1722565567
}
```

### Print finished in OctoPrint

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Done",
  "message": "Your print is done.",
  "extra": {
    "name": "cube_0.8n_0.4mm_PETG_235C.gcode",
    "path": "Calbration/cube_0.8n_0.4mm_PETG_235C.gcode",
    "origin": "local",
    "size": 85675,
    "owner": "mike",
    "time": 1150.5227840360021,
    "time_formatted": "0:19:10"
  },
  "state": {
    "text": "Operational",
    "flags": {
      "operational": "True",
      "printing": "False",
      "cancelling": "False",
      "pausing": "False",
      "resuming": "False",
      "finishing": "False",
      "closedOrError": "False",
      "error": "False",
      "paused": "False",
      "ready": "True",
      "sdReady": "True"
    },
    "error": ""
  },
  "job": {
    "file": {
      "name": "cube_0.8n_0.4mm_PETG_235C.gcode",
      "path": "Calbration/cube_0.8n_0.4mm_PETG_235C.gcode",
      "display": "cube_0.8n_0.4mm_PETG_235C.gcode",
      "origin": "local",
      "size": 85675,
      "date": 1660616550
    },
    "estimatedPrintTime": 859.9312829893596,
    "averagePrintTime": 1051.9797971350054,
    "lastPrintTime": 1051.9797971350054,
    "filament": {
      "tool0": {
        "length": 1853.3127900000088,
        "volume": 4.457739663242711
      }
    },
    "user": "mike"
  },
  "progress": {
    "completion": 100.0,
    "filepos": 85675,
    "printTime": 1150,
    "printTimeLeft": 0,
    "printTimeLeftOrigin": "None"
  },
  "currentZ": 74.1,
  "offsets": {},
  "meta": {
    "hash": "a82a304c4045f4e0b172397b5f4d4dc34a036a5f",
    "analysis": {
      "printingArea": {
        "maxX": 141.336,
        "maxY": 121.336,
        "maxZ": 25.1,
        "minX": 0.0,
        "minY": -3.0,
        "minZ": 0.0
      },
      "dimensions": {
        "depth": 124.336,
        "height": 25.1,
        "width": 141.336
      },
      "estimatedPrintTime": 859.9312829893596,
      "filament": {
        "tool0": {
          "length": 1853.3127900000088,
          "volume": 4.457739663242711
        }
      }
    },
    "history": [
      {
        "timestamp": 1660617819.5876584,
        "printTime": 1051.9797971350054,
        "success": "True",
        "printerProfile": "mk3splus2"
      },
      {
        "timestamp": 1722566717.675641,
        "printTime": 1150.5227840360021,
        "success": "True",
        "printerProfile": "mk3splus2"
      }
    ],
    "statistics": {
      "averagePrintTime": {
        "mk3splus2": 1101.2512905855037
      },
      "lastPrintTime": {
        "mk3splus2": 1150.5227840360021
      }
    }
  },
  "currentTime": 1722566717
}
```

### Print started on printer using SD card

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Started",
  "message": "Your print has started.",
  "extra": {
    "name": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "path": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "origin": "sdcard",
    "size": 36162
  },
  "state": "",
  "job": "",
  "progress": "",
  "currentZ": "",
  "offsets": "",
  "meta": "",
  "currentTime": 1722567131
}
```

### Print finished on printer using SD card

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Done",
  "message": "Your print is done.",
  "extra": {
    "name": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "path": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "origin": "sdcard",
    "size": 36162,
    "time": 312.77999567898223,
    "time_formatted": "0:05:12"
  },
  "state": "",
  "job": "",
  "progress": "",
  "currentZ": "",
  "offsets": "",
  "meta": "",
  "currentTime": 1722567444
}
```

### Print stopped on printer

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Failed",
  "message": "Something went wrong and your print has failed.",
  "extra": {
    "name": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "path": "Shape-Box_0.8n_0.4mm_PETG_MK3S_2m.gcode",
    "origin": "sdcard",
    "size": 36162,
    "position": {
      "x": "None",
      "z": "None",
      "t": "None",
      "y": "None",
      "e": "None",
      "f": "None"
    },
    "fileposition": 12560,
    "progress": 34,
    "time": 287.36758312408347,
    "reason": "cancelled",
    "time_formatted": "0:04:47"
  },
  "state": "",
  "job": "",
  "progress": "",
  "currentZ": "",
  "offsets": "",
  "meta": "",
  "currentTime": 1722728256
}
```

### Print stopped on OctoPrint

```json
{
  "deviceIdentifier": "delta",
  "apiSecret": "",
  "topic": "Print Failed",
  "message": "Something went wrong and your print has failed.",
  "extra": {
    "name": "shape~10.gco",
    "path": "shape~10.gco",
    "origin": "sdcard",
    "size": 36162,
    "position": {
      "x": "None",
      "z": "None",
      "t": "None",
      "y": "None",
      "e": "None",
      "f": "None"
    },
    "fileposition": 11897,
    "progress": 32,
    "owner": "mike",
    "user": "mike",
    "time": 268.68962830200326,
    "reason": "cancelled",
    "time_formatted": "0:04:28"
  },
  "state": "",
  "job": "",
  "progress": "",
  "currentZ": "",
  "offsets": "",
  "meta": "",
  "currentTime": 1722729695
}
```
