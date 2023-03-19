---
title: Raspberry PI
categories:
  - posts
tags:
  - Raspberry PI
---

With the weather getting a little chilly I wanted to monitor the temperature in my kids room.

I had a Raspbery PI 2 Ver B lying around and I ordered some bits and bobs off trademe for a bit of messing about.

* DHT11 Temperature sensor
* OLED display
* Breadboard and resistors

## Running RASPBIAN JESSIE WITH PIXEL OS

* Version:April 2017
* Release date:2017-04-10
* Kernel version:4.4

## 1 Installing updates

*Not 100% sure if [updating](https://www.npmjs.com/package/raspberry) is totally necessary, however we do need nodejs and npm installed*

```css
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nodejs npm
```

### 1.1 Alternate method is to upgrade Node to version 7 on Raspbian

```css
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install build-essential
```

## 2 Patch v8.h to fix REPLACE_INVALID_UTF8 build issue

Raspbian 2017-04-10 ships with node version 0.10.29. However in order to build the libraries in this project requires editing the /usr/include/nodejs/deps/v8/include/v8.h file. [more info](https://www.raspberrypi.org/forums/viewtopic.php?f=66&t=127939)

1. Open using command 'sudo nano /usr/include/nodejs/deps/v8/include/v8.h'
2. Search for WriteOptions

```c
enum WriteOptions {
    NO_OPTIONS = 0,
    HINT_MANY_WRITES_EXPECTED = 1,
    NO_NULL_TERMINATION = 2,
    PRESERVE_ASCII_NULL = 4,
};
```

3. Add the REPLACE_INVALID_UTF8 = 0 line (note the comma on previous line)

```c
enum WriteOptions {
    NO_OPTIONS = 0,
    HINT_MANY_WRITES_EXPECTED = 1,
    NO_NULL_TERMINATION = 2,
    PRESERVE_ASCII_NULL = 4,
    REPLACE_INVALID_UTF8 = 0
};
```

## 3 Blynk

### 3.1 Install Blynk libraries

```cs
sudo npm install -g onoff
sudo npm install -g blynk-library
```

### 3.2 Test Blynk

```cs
export NODE_PATH=/usr/local/lib/node_modules
blynk-client 715f8cafe95f4a91bae319d0376caa8c
```

## Project 1 (Easy): Make an LED turn off and on using Blynk

### Hardware requirements

* LED 
* Resistor 330-500 ohm or there abouts
* Breadboard
* 2 x wire connectors Male to Female.

## Project 2: Temperature sensor

### Hardware requirements

* DHT11 sensor
* 10K resistor
* 2 x wire connectors Male to Female.

1. Follow instructions to wire up the [DHT11 to PI](https://github.com/momenso/node-dht-sensor)
2. Follow instructions to create Blynk project and install [node DHT sensor](http://www.instructables.com/id/Raspberry-Pi-Nodejs-Blynk-App-DHT11DHT22AM2302/) library
3. Create temp.js file with contents below set with your AUTH key. *Note: The below script has an additional virtual port 2 to display a temp digital readout*

```js
    var blynkLib = require('blynk-library');
    var sensorLib = require('node-dht-sensor');

    var AUTH = 'YOUR KEY HERE';

    // Setup Blynk
    var blynk = new blynkLib.Blynk(AUTH);

    // Setup sensor, exit if failed
    var sensorType = 11; // 11 for DHT11, 22 for DHT22 and AM2302
    var sensorPin  = 4;  // The GPIO pin number for sensor signal
    if (!sensorLib.initialize(sensorType, sensorPin)) {
        console.warn('Failed to initialize sensor');
        process.exit(1);
    }

    // Automatically update sensor value every 2 seconds
    setInterval(function() {
        var readout = sensorLib.read();
        var temp = readout.temperature.toFixed(1);
        var humidity = readout.humidity.toFixed(1);
        blynk.virtualWrite(2, temp);
        blynk.virtualWrite(3, temp);
        blynk.virtualWrite(4, humidity);
        
        console.log('Temperature:', temp + 'C');
        console.log('Humidity:   ', humidity + '%');
    }, 5000);
```
4. Next run the temp script

```cs
sudo NODE_PATH=/usr/local/lib/node_modules node ./temp.js
```

## Project 3: OLED display

1. [Follow instructions](https://blog.jokielowie.com/en/2016/03/wyswietlacz-oled-ssd1306-i-raspberry-pi/)
2. TODO Display temp and humidity to OLED

## Reference

### Raspberry PI PIN diagram

![Raspberry PI PIN diagram](/assets/images/GPIO-Raspberry-Pi.jpg)