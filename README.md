This script will test the ping between two IP addresses (defaults are set to "192.168.0.1" and "8.8.8.8") for any ping over 200 (see line 25 to configure this) it will log the results into a seperate log file in the same folder it has been ran.

Example log output:

>High ping detected on 8.8.8.8 - 422 ms at YYYY-MM-DD HH:mm:ss <br>
>Ping result for 192.168.0.1: 8 ms <br>
>Ping result for 8.8.8.8: 422 ms <br>

Personally used for monitoring connection between router and google DNS.
