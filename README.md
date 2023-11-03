# PowerShell TCP Network Connection Tester

This PowerShell script is designed to test TCP network connections using the `Test-NetConnection` cmdlet. It provides a user-friendly interface for users to input the destination IP address, port number, and the number of repetitions for testing. The script includes validation checks to ensure that the provided inputs are correct.

## How it Works

1. **IP Address Validation**: The script starts by collecting a destination IP address from the user and uses regular expressions to validate that the input is a valid IPv4 address. It continues prompting the user until a valid IP address is entered.

2. **Port Validation**: After obtaining the IP address, the script collects the destination port number from the user, validating that it's within the valid range of 0 to 65535.

3. **Repetition Count**: The user is then asked to specify the number of times they want to run the `Test-NetConnection`. The script checks that the input is a positive integer.

4. **Test Loop**: A `for` loop is used to execute the `Test-NetConnection` with the specified IP address and port for the given number of repetitions. The results of each test (success or failure) are counted.

5. **Results**: After all tests are completed, the script displays the total number of successful and failed connections.

6. **User Interaction**: To prevent the PowerShell window from closing immediately, the script waits for the user to press any key before exiting.

This script offers an easy way to test TCP network connections, making it suitable for checking the availability and reachability of remote services and servers. It provides feedback on successful and failed connections, making it a useful tool for network troubleshooting and monitoring.

## Usage

1. Clone or download this repository.
2. Open a PowerShell prompt.
3. Navigate to the project directory.
4. Run the script using `.\NetworkConnectionTester.ps1`.

## Dependencies

- PowerShell (Windows)
- `Test-NetConnection` cmdlet

## License

This project is licensed under the [MIT License]

```markdown
