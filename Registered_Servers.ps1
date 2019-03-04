<#
Purpose - To find whether the server is registered in OP5
Developer - Janarthanan
Date - 19/2/2019
#>

#Ignoring the SSL certificate

add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12

cls

"
Purpose - To find whether the server is registered in OP5
OP5 server name - TestOP5server
"
$list_1=Read-Host "Please provide the list of servers [D:\VM.txt]"

$list=Get-content $list_1

$cred=Get-Credential

"
----Results----

"

foreach ($server in $list)
{
# RestAPI Link for a host -> https://TestOP5server/api/status/host/server1?format=json

$link="https://TestOP5server/api/status/host/"+$server+"?format=json"

try{
$reply=Invoke-RestMethod -Uri $link -Method Get  -Credential $cred | select address -ExpandProperty address
"[Registered in OP5] -> $reply"
}

catch{
"[Not Registered in OP5] -> $server"
}

}