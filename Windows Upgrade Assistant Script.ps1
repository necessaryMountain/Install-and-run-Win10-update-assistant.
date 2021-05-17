#Windows upgrade script found on spiceworks.com from user mikehanseman.  Full credit goes to them, though I know there are other similar scripts out there.

#defines a directory to store the Windows update Assistant
$dir = 'C:\temp'

#makes the defined directory, but doesn't overwrite an existing directory
mkdir $dir

#creates a new object using the WebClient class
$webClient = New-Object System.Net.WebClient

#defines the url for downloading the windows update assistant
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'

#defining a full file path to store the upgrade assistant
$file = "$($dir)\Windows10Upgrade9252.exe"

#downloading the file from that url using the defined path
$webClient.DownloadFile($url,$file)

#Starting the upgrade assistant
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'