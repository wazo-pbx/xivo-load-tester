# xivo-load-tester

A call generator to do simple load testing scenarios.

Based on sipp.

## Usage

Copy etc/conf.py.sample to etc/conf.py and edit the latter.

Run `./load-tester scenarios/your-scenario`

## Dependencies

* sipp with OpenSSL, RTP streaming and GSL support
    * see [compiling sipp](#compiling-sipp)
* jinja2
    * apt-get install python-jinja2


### Compiling sipp

This version of load-tester has been tested against sipp 3.4.1.

1. Download the [latest sipp release](https://github.com/SIPp/sipp/releases)
2. Extract it:
   ```
   tar xvf sipp-3.4.1.tar.gz
   cd sipp-3.4.1
   ```
3. Install the build dependencies:
   ```
   apt-get install build-essential pkg-config libssl-dev libncurses5-dev libgsl0-dev
   ```
4. Build it:
   ```
   ./configure --with-openssl --with-rtpstream --with-gsl
   make
   ```
5. Install it:
   ```
   make install
   ```
