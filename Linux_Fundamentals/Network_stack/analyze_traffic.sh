#!/usr/bin/bash

if [ -z "$1" ]; then
    echo "please Enter your pcap file"
    exit 1
fi
pcap_file=$1 
# Bash Script to Analyze Network Traffic
if [ ! -f "${pcap_file}" ]; then
    echo "File ${pcap_file} Not exists"
    exit 1
fi
# capture input from terminal.
output_data="result.txt"

total_packets=$(tcpdump -r "${pcap_file}" 2>/dev/null | wc -l)

http_packets=$(tcpdump -r "${pcap_file}" 2>/dev/null -nn "tcp port 80" | wc -l)

https_packets=$(tcpdump -r "${pcap_file}" 2>/dev/null -nn "tcp port 443" | wc -l)

Top_5_Source_IP_Addresses=$(tcpdump  -r "${pcap_file}" -nn  2>/dev/null | awk '{print $3}' | cut -d'.' -f1-4 | sort | uniq -c | sort -nr | head -n 5 )

Top_5_dest_IP_Addresses=$(tcpdump -r "$pcap_file" -nn 2>/dev/null | awk '{print $5}' | cut -d. -f1-4 | sort | uniq -c | sort -nr | head -n 5)

# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Hint: Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    # extract IP addresses, and generate summary statistics.

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: ${total_packets}"
    echo "1. Total Packets: ${total_packets}" > "${output_data}"

    echo "2. Protocols:"
    echo "2. Protocols:" >> "${output_data}"

    echo "   - HTTP: ${http_packets} packets"
    echo "   - HTTP: ${http_packets} packets" >> "${output_data}"


    echo "   - HTTPS/TLS: ${https_packets} packets"
    echo "   - HTTPS/TLS: ${https_packets} packets" >> "${output_data}"

    echo "3. Top 5 Source IP Addresses:"
    echo "3. Top 5 Source IP Addresses:" >> "${output_data}"

    # Provide the top source IP addresses
    echo "${Top_5_Source_IP_Addresses}"
    echo "${Top_5_Source_IP_Addresses}" >> "${output_data}"

    echo "4. Top 5 Destination IP Addresses:"
    echo "4. Top 5 Destination IP Addresses:" >> "${output_data}"

    # Provide the top destination IP addresses
    echo "${Top_5_dest_IP_Addresses}"
    echo "${Top_5_dest_IP_Addresses}" >> "${output_data}"

    echo "----- End of Report -----"
    echo "----- End of Report -----" >> "${output_data}"
}

# Run the analysis function
analyze_traffic
