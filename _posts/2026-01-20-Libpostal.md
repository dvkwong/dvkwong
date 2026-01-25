---
categories:
  - AI
tags:
    - Addresses
toc: true
---

```bash
docker pull senzing/libpostal-docker:latest
docker run -it senzing/libpostal-docker:latest address_parser

> "781 Franklin Ave Crown Heights Brooklyn NY"
{
  "house_number": "781",
  "road": "Franklin Ave",
  "suburb": "Crown Heights",
  "city_district": "Brooklyn",
  "state": "NY"
}
```
