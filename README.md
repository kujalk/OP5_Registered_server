# OP5_Registered_server
Script to identify whether a server is registered in OP5 Monitoring system


At one day, I got a request to delete a bulk of VM servers. So, to avoid the hassle to check whether each of these servers are registered in OP5 Monitoring system, I quickly wrote a PowerShell script using OP5 Rest API. So, in this blog post, I shared the same script with you all, to identify whether the particular server is registered in OP5.


If the server is registered, it will return 
"[Registered in OP5] -> Server Name"

If the server is not registered, it will return
"[Not Registered in OP5] ->Server Name"

Note – Replace the OP5 server name [“TestOP5server”] in the script with your OP5 host name
