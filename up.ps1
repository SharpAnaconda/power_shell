function ReadPrintSettings ($file){
    rundll32 printui.dll, PrintUIEntry /Sr /n "Sharp Print System" /a $file
}
ReadPrintSettings(".\up2.dat")
$folder = "C:\Users\s138093\Desktop\修繕費"
Get-ChildItem ($folder + "\*") -Include *.pdf | Sort-Object Name | ForEach-Object {
    Write-Host $_.Name
    Start-Process $_.FullName -Verb Print | Stop-Process
    Start-Sleep -s 1
}
ReadPrintSettings(".\up1.dat")
Write-Host "Press any key to finish."
Read-Host