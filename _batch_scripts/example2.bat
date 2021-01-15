:: This batch file checks for network connection problems.
ECHO OFF
:: View network connection details
ipconfig /all
:: Check if geeksforgeeks.org is reachable
ping geeksforgeeks.org
:: Run a traceroute to check the route to geeksforgeeks.org
tracert geeksforgeeks.org
PAUSE