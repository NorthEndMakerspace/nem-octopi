# Using the OctoPrint API

Get an API key by logging on to OctoPrint, going to `Settings -> Application Keys`.

Requests to the API need an `Authorization` header in the format of `Authorization: Bearer api_key_string`.

## Examples

Get OctoPrint version:

```bash
$ curl -H 'Authorization: Bearer api_key_string' http://pinky.local/api/version
{
  "api": "0.1",
  "server": "1.10.2",
  "text": "OctoPrint 1.10.2"
}
```

Get the printer's current status:

```bash
curl -H 'Authorization: Bearer api_key_string' http://pinky.local/api/printer
{
  "sd": {
    "ready": true
  },
  "state": {
    "error": "",
    "flags": {
      "cancelling": false,
      "closedOrError": false,
      "error": false,
      "finishing": false,
      "operational": true,
      "paused": false,
      "pausing": false,
      "printing": false,
      "ready": true,
      "resuming": false,
      "sdReady": true
    },
    "text": "Operational"
  },
  "temperature": {
    "A": {
      "actual": 34.0,
      "offset": 0,
      "target": null
    },
    "P": {
      "actual": 0.0,
      "offset": 0,
      "target": null
    },
    "bed": {
      "actual": 26.7,
      "offset": 0,
      "target": 0.0
    },
    "tool0": {
      "actual": 25.5,
      "offset": 0,
      "target": 0.0
    }
  }
}
```

## Reference

OctoPrint API docs: <https://docs.OctoPrint.org/en/master/api/>
