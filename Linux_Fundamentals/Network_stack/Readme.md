# Network Traffic Analysis Script:

This script analyzes network traffic from a given .pcap file and generates a summary report of various traffic statistics, including total packet counts, HTTP/HTTPS traffic, and the top 5 source and destination IP addresses.

# *Prerequisites*
tcpdump: A network packet analyzer tool used to capture and analyze network traffic.
Bash: The script is written for a Bash shell environment.
Ensure you have the necessary permissions to read the .pcap file.
Features
Total Packet Count: Counts the total number of packets in the .pcap file.
HTTP Packet Count: Counts the number of HTTP packets (TCP port 80).
HTTPS Packet Count: Counts the number of HTTPS packets (TCP port 443).
Top 5 Source IP Addresses: Identifies the top 5 source IP addresses based on the captured traffic.
Top 5 Destination IP Addresses: Identifies the top 5 destination IP addresses based on the captured traffic.
Summary Report: Generates a detailed report saved to a result.txt file, as well as printed to the terminal.
Usage
To use the script, run it from the terminal, passing the .pcap file as an argument:

# bash

 "./analyze_traffic.sh /path/to/your/pcap_file.pcap"

# Example bash

'$ ./analyze_traffic.sh /path/to/traffic.pcap'
Script Breakdown
Input Validation:

The script expects a .pcap file as an argument.
If no argument is provided, it will prompt the user to enter the file.
If the provided file does not exist, the script will exit with an error message.
Traffic Analysis:

Total Packets: The script counts all packets in the .pcap file using tcpdump.
HTTP Packets: It filters and counts packets that use TCP port 80.
HTTPS Packets: It filters and counts packets that use TCP port 443.
Top 5 Source IPs: It uses tcpdump to extract the source IPs, counts their occurrences, and lists the top 5.
Top 5 Destination IPs: It similarly extracts destination IPs, counts their occurrences, and lists the top 5.
Report Generation:

The results of the analysis are displayed in the terminal.
The same results are saved to a result.txt file for later review.
Output
After running the script, you will see the following output in the terminal and the result.txt file:

markdown
Copy code
----- Network Traffic Analysis Report -----
1. Total Packets: 1000
2. Protocols:
   - HTTP: 500 packets
   - HTTPS/TLS: 200 packets
3. Top 5 Source IP Addresses:
   150 192.168.1.1
   100 10.0.0.1
   85 172.16.0.2
   67 192.168.0.5
   42 10.1.1.3
4. Top 5 Destination IP Addresses:
   200 192.168.1.100
   150 172.16.0.50
   130 10.0.0.200
   90 192.168.0.101
   80 10.1.1.50
----- End of Report -----
Notes
The script assumes that the .pcap file contains IPv4 addresses.
If the .pcap file contains IPv6 addresses or encrypted traffic, additional analysis may be required.

