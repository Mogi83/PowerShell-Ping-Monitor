# PowerShell-Ping-Monitor

## Description

The `PowerShell-Ping-Monitor` script monitors network health by periodically pinging specified IP addresses and logging any high ping results or timeouts. Created to track the connection between a router and an external DNS server, this PowerShell script offers a straightforward method for network monitoring. It logs results to a file and alerts you if the ping response exceeds a predefined threshold.

## Features

- **Ping Monitoring:** Continuously pings specified IP addresses to check network latency.
- **High Ping Detection:** Logs high ping results (default threshold is 200 ms) with a timestamp.
- **Timeout Handling:** Records any request timeouts or errors.
- **Customizable Hosts:** Easily change the IP addresses to monitor.
- **Log File:** Saves results in a log file (`ping_log.txt`) for review.

## Usage

1. Clone or download the repository to your local machine.
2. Open the `PowerShell` script in your preferred editor.
3. Optionally, modify the IP addresses or threshold values in the script.
4. Run the script using PowerShell:
   ```powershell
   .\PowerShell-Ping-Monitor.ps1
   ```
5. Check the `ping_log.txt` file for logged results.

## Script Overview

- **IP Addresses:** The default IP addresses are `192.168.0.1` and `8.8.8.8`. Modify the `$hosts` array in the script to change these.
- **Threshold:** The default threshold for high ping detection is 200 ms. Adjust this value in the script if needed.
- **Log File:** Logs are stored in `ping_log.txt` within the same directory as the script.

## Example Log Output

```
High ping detected on 8.8.8.8 - 422 ms at YYYY-MM-DD HH:mm:ss
Ping result for 192.168.0.1: 8 ms
Ping result for 8.8.8.8: 422 ms
```

## Notes

- Ensure PowerShell script execution is permitted on your system.
- Customize the script according to your monitoring requirements, ensure you change you host parameter to match your network.

## Further Reading

For a detailed explanation of the script and its implementation, visit my blog post: [Monitoring Network Health with PowerShell: A High Ping and Timeout Logging Script](https://mogi83.github.io/posts/Monitoring-Network-Health-with-Powershell/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
