#collects destination IP from user and validates user input with regex.
while ($true) {
    $ipAddr = Read-Host "Enter destination IP address"
    
    if ($ipAddr -match '^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$') {
        Write-Host "You entered a valid IPv4 address: $ipAddr"
        break
    } else {
        Write-Host "Invalid IPv4 address. Please try again."
    }
}

#collects destination port from user and validates user input.
while ($true) {
    $destPort = Read-Host "Enter the destination port (0 and 65535)"
    if ($destPort -match '^\d+$' -and [int]$destPort -ge 0 -and [int]$destPort -le 65535) {
        Write-Host "You entered a valid port: $destPort"
        break
    } else {
        Write-Host "Invalid port number. Please try again."
    }
}

#collects the number of repetitions that test-netconnection will run.
while ($true) {
    $reps = Read-Host "Enter amount of tests you would like to do"
    if ($reps -match '^\d$' -and [int]$reps -ge 1 ) {
        Write-Host "You are going to repeat the TNC $reps times"
        break
    } else {
        Write-Host "You input was invalid, Please try again."
    }
}

#setting varibles for last output
$tcpGood = 0
$tcpBad = 0

#for loop to run the test-netconnection the speficied amount of times
for($i = 1; $i -le $reps; $i++) {

    $result = Test-NetConnection $ipAddr -Port $destPort

    if ($result.TcpTestSucceeded) {
        Write-Host "Connection to $ipAddr on port $destPort succeeded!"
        $tcpGood ++
    } else {
        Write-Host "Connection to $ipAddr on port $destPort failed!"
        $tcpBad ++
    }
}
#outputs the good and bad results. 
Write-Host "Test-NetConnection to ${ipAddr}:${destPort} succeeded $tcpGood times."
Write-Host "Test-NetConnection to ${ipAddr}:${destPort} failed $tcpBad times."

#stops window from closing
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');