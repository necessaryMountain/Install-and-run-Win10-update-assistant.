#Windows upgrade script.  This is fairly generic.  Works to upgrade Windows 8.1 to 10 and for Windows 10 machines to get them to the newest feature update.

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

#Starting the upgrade assistant.  Runs silently and will restart as soon as possible.
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'
