# Define the IP addresses or hostnames to ping
$hosts = @("192.168.0.1", "8.8.8.8")

# Store ping results
$pingResults = @{}

# Function to perform ping and check conditions
function Check-Ping {
    param (
        [string]$TargetHost
    )

    Write-Output "Pinging $TargetHost..."

    try {
        # Perform the ping
        $pingResult = Test-Connection -ComputerName $TargetHost -Count 1 -ErrorAction Stop
        $responseTime = $pingResult.ResponseTime
        Write-Output "Ping result for ${TargetHost}: ${responseTime} ms"

        # Store the result
        $pingResults[$TargetHost] = $responseTime

        # Check for high ping
        if ($responseTime -gt 200) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $logMessage = "High ping detected on ${TargetHost} - ${responseTime} ms at ${timestamp}`n"

            # Add results for all hosts with the same timestamp
            foreach ($currentHost in $hosts) {
                if ($pingResults.ContainsKey($currentHost)) {
                    $resultTime = $pingResults[$currentHost]
                    $logMessage += "Ping result for ${currentHost}: ${resultTime} ms`n"
                } else {
                    $logMessage += "Ping result for ${currentHost}: No result at ${timestamp}`n"
                }
            }
            
            # Write the accumulated log message
            $logMessage | Add-Content -Path "ping_log.txt"
        }
    } catch {
        # Handle timeout or any errors
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "Request timed out or error occurred on ${TargetHost} at ${timestamp}`n"
        $logMessage += $_.Exception.Message
        $logMessage | Add-Content -Path "ping_log.txt"
    }
}

# Main loop to continuously check the hosts
Write-Output "Starting script at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
while ($true) {
    # Reset ping results before each iteration
    $pingResults.Clear()

    foreach ($currentHost in $hosts) {
        Check-Ping -TargetHost $currentHost
    }
    
    # Output waiting message and add a line break
    Write-Output "Waiting for 1 second before next check..."
    Write-Output ""  # Adds a blank line
    Start-Sleep -Seconds 1
}
Write-Output "Script completed at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Read-Host -Prompt "Press Enter to exit"
