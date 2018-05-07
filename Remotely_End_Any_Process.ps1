$ComputerName = Read-Host -Prompt 'Input Computer name'
$ProcessName = Read-Host -Prompt 'Input Process Name'

$Processes = Get-WmiObject -Class Win32_Process -ComputerName $ComputerName -Filter "name='$ProcessName'" -ErrorAction SilentlyContinue

foreach ($process in $processes) {
try{
  $returnval = $process.terminate()
  $processid = $process.handle
  }
 catch {
}
Finally {
}
 
if($returnval.returnvalue -eq 0) {
  write-host "The process $ProcessName `($processid`) terminated successfully"
}
else {
  write-host "The process $ProcessName `($processid`) termination has some problems"
}

}

