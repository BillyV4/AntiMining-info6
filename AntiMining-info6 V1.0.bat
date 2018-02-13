@echo OFF
color 0A
ECHO   ___        _   ____  ____       _                    _        __       ____ 
ECHO  / _ \      ^| ^| (_)  \/  (_)     (_)                  (_)      / _^|     / ___^|
ECHO / /_\ \_ __ ^| ^|_ _^| .  . ^|_ _ __  _ _ __   __ _ ______ _ _ __ ^| ^|_ ___ / /___ 
ECHO ^|  _  ^| '_ \^| __^| ^| ^|\/^| ^| ^| '_ \^| ^| '_ \ / _` ^|______^| ^| '_ \^|  _/ _ \^| ___ \
ECHO ^| ^| ^| ^| ^| ^| ^| ^|_^| ^| ^|  ^| ^| ^| ^| ^| ^| ^| ^| ^| ^| (_^| ^|      ^| ^| ^| ^| ^| ^|^| (_) ^| \_/ ^|
ECHO \_^| ^|_/_^| ^|_^|\__^|_\_^|  ^|_/_^|_^| ^|_^|_^|_^| ^|_^|\__, ^|      ^|_^|_^| ^|_^|_^| \___/\_____/
ECHO                                            __/ ^|                              
ECHO                                           ^|___/    
ECHO By CARLOS RAMIREZ LOPEZ V1.0
timeout /T 3
color 0F

echo Validation of classes and variables

powershell.exe Get-WMIObject -Namespace root\Subscription -Class __EventFilter -filter {Name= 'SCM Event Log Filter'}
powershell.exe Get-WMIObject -Namespace root\Subscription -Class CommandLineEventConsumer -Filter {Name='DSM Event Log Consumer'}
powershell.exe Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding -Filter {__Path LIKE '%DSM Event Log Consumer%'}

echo Removed from malicious variables

timeout /T 2
powershell.exe Get-WMIObject -Namespace root\Subscription -Class __EventFilter -filter {Name= 'SCM Event Log Filter'} ^| Remove-WMIObject  -Verbose
powershell.exe Get-WMIObject -Namespace root\Subscription -Class CommandLineEventConsumer -Filter {Name='DSM Event Log Consumer'} ^| Remove-WMIObject -Verbose
powershell.exe Get-WMIObject -Namespace root\Subscription -Class __FilterToConsumerBinding -Filter {__Path LIKE '%DSM Event Log Consumer%'} ^| Remove-WMIObject -Verbose

color 0A
echo Clean system
timeout /T 10