﻿
$ErrorActionPreference = "SilentlyContinue"

param (
    [string]$file1,
    [string]$file2
 )
 
function BOX ($TITLE){
"█" * $TITLE.Length+"████"; Write-Output "█ $TITLE █"; "█" * $TITLE.Length+"████"|Format-Table
}

function COMPO{
BOX "Left Arrow Indicates first file and Right Arrow Indicates Second File"
compare (gc $file1) (gc $file2)
}

function WORK{
Write-Output "                    _    _             "
Write-Output "__      _____  _ __| | _(_)_ __   __ _ "
Write-Output "\ \ /\ / / _ \| '__| |/ / | '_ \ / _  |"
Write-Output " \ V  V / (_) | |  |   <| | | | | (_| |"
Write-Output "  \_/\_/ \___/|_|  |_|\_\_|_| |_|\__, |"
Write-Output "                                 |___/ "
}

function DONE{
Write-Output "     _                    _ "
Write-Output "  __| | ___  _ __   ___  / \"
Write-Output " / _`  |/ _ \| '_ \ / _ \/  /"
Write-Output "| (_| | (_) | | | |  __/\_/ "
Write-Output " \__,_|\___/|_| |_|\___\/   "
}
 
 if($file1 -and $file2){
 cls
 WORK
 COMPO
 DONE
 return
 }

function POL64{
Get-ChildItem -r registry::HKCU\SOFTWARE\Policies
Get-ChildItem -r registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\Policies
Get-ChildItem -r registry::HKLM\SOFTWARE\Policies
Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Policies
Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\PolicyManager
Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\Policies
}

function POL32{
Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Policies
Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Policies
Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\Policies
}

function HKLM32{
Get-ChildItem -Name registry::HKLM\SOFTWARE\WOW6432Node\Microsoft|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\$_}
Get-ChildItem -Name registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\$_}
Get-Item registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion
Get-Item registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r "registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\Shell Extensions"
Get-ChildItem -Name registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion|?{$evo=($_ -match "run");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\$_;Get-ItemProperty registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\Currentversion\$_}
Get-ChildItem -r "registry::HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT"
}

function HKLM64{
Get-ChildItem -Name registry::HKLM\SOFTWARE\Microsoft|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\$_}
Get-ChildItem -Name registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-Item registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion
Get-Item registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r "registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\Shell Extensions"
Get-ChildItem -Name registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "run");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\$_;Get-ItemProperty registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-ChildItem -r "registry::HKLM\SOFTWARE\Microsoft\Windows NT"
}

function HKCU{
Get-ChildItem -Name registry::HKCU\SOFTWARE\Microsoft|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKCU\SOFTWARE\Microsoft\$_}
Get-ChildItem -Name registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKLM\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-Item registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion
Get-Item registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r "registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\Shell Extensions"
Get-ChildItem -Name registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "run");$evo}|%{Get-ChildItem -r registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\$_;Get-ItemProperty registry::HKCU\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-ChildItem -r "registry::HKCU\SOFTWARE\Microsoft\Windows NT"
}

function HKU{
Get-ChildItem -Name registry::HKU\.DEFAULT\SOFTWARE\Microsoft|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKU\.DEFAULT\SOFTWARE\Microsoft\$_}
Get-ChildItem -Name registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "internet");$evo}|%{Get-ChildItem -r registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-Item registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion
Get-Item registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\Explorer
Get-ChildItem -r "registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\Shell Extensions"
Get-ChildItem -Name registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion|?{$evo=($_ -match "run");$evo}|%{Get-ChildItem -r registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\$_;Get-ItemProperty registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\Currentversion\$_}
Get-ChildItem -r "registry::HKU\.DEFAULT\SOFTWARE\Microsoft\Windows NT"
}

function SERVICES{
Get-ChildItem -r registry::hklm\SYSTEM\CurrentControlSet\Services
}

function KERNMOD{
Get-ChildItem -r registry::hklm\SYSTEM\CurrentControlSet\Enum
Get-ChildItem -r registry::hklm\SYSTEM\CurrentControlSet\Control
}

function FILEZ{
Get-ChildItem -r "c:\users\Default" -Force
Get-ChildItem -r "c:\users\all users" -Force
Get-ChildItem -r c:\windows\Prefetch
Get-ChildItem -r c:\windows\temp
Get-ChildItem c:\windows\system32\*.exe
}

do
{
cls     
Write-Output "  ██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗██╗"
Write-Output "  ██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝██║"
Write-Output "  ██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ██║"
Write-Output "  ██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝"
Write-Output "  ╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██╗"
Write-Output "   ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝"
BOX "                  Aneesh Patel's BASELINER!!! v0.7b             "
     Write-Output ""
     Write-Output "Press '1' to store a baseline log."
     Write-Output "Press '2' to store a second log."
     Write-Output "Press '3' to compare ONLY after the above two logs are created."
     Write-Output "Press '4' to delete tmp files created."
     Write-Output "Press 'Q' to quit."
     Write-Output ""
     $option = Read-Host "Please make a selection"
     switch ($option)

     {
           '1' {
                cls

                WORK
                $m1 = POL64
                POL64 > m1.tmp              
                DONE
                Write-Output ""
                Write-Host Parsed ($m1).count 64BIT Policy Entries
                
                WORK
                $m2 = POL32
                POL32 >m2.tmp
                DONE

                Write-Output ""
                Write-Host Parsed ($m2).count 32BIT Policy Entries
                
                WORK
                $m3 = HKLM32
                HKLM32 >m3.tmp             
                DONE
                Write-Output ""
                Write-Host Parsed ($m3).count 32BIT HKLM Entries
                
                WORK
                $m4 = HKLM64
                HKLM64 >m4.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m4).count 64BIT HKLM Entries
                
                WORK
                $m5 = HKCU
                HKCU >m5.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m5).count HKCU Entries
                
                WORK
                $m6 = HKU
                HKU >m6.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m6).count HKU Entries
                
                WORK
                $m7 = SERVICES
                SERVICES >m7.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m7).count Service Entries

                WORK
                $m8 = KERNMOD
                KERNMOD > m8.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m8).count Kernel Driver Entries

                WORK
                $m9 = FILEZ
                FILEZ > m9.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($m9).count File System Entries               

                pause
           }

           '2' {
                cls
                WORK
                $n1 = POL64
                POL64 >n1.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n1).count 64BIT Policy Entries
                
                WORK
                $n2 = POL32
                POL32 >n2.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n2).count 32BIT Policy Entries
                
                WORK
                $n3 = HKLM32             
                HKLM32 >n3.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n3).count 32BIT HKLM Entries
                
                WORK
                $n4 = HKLM64
                HKLM64 >n4.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n4).count 64BIT HKLM Entries
                
                WORK
                $n5 = HKCU
                HKCU >n5.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n5).count HKCU Entries
                
                WORK
                $n6 = HKU
                HKU >n6.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n6).count HKU Entries
                
                WORK
                $n7 = SERVICES
                SERVICES >n7.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n7).count Service Entries
                
                WORK
                $n8 = KERNMOD
                KERNMOD >n8.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n8).count Kernel Driver Entries
                
                WORK
                $n9 = FILEZ
                FILEZ >n9.tmp
                DONE
                Write-Output ""
                Write-Host Parsed ($n9).count File System Entries               
                
                pause           
           } 

           '3' {
                cls
                BOX "Comparing 64 Bit Policies"
                compare (gc m1.tmp) (gc n1.tmp)

                BOX "Comparig 32 Bit Policies"
                compare (gc m2.tmp) (gc n2.tmp)

                BOX "Comparing 32 Bit HKLM Areas"
                compare (gc m3.tmp) (gc n3.tmp)

                BOX "Comparing 64 Bit HKLM Areas"
                compare (gc m4.tmp) (gc n4.tmp)

                BOX "Comparing HKCU Areas"
                compare (gc m5.tmp) (gc n5.tmp)

                BOX "Comparing HKU"
                compare (gc m6.tmp) (gc n6.tmp)

                BOX "Comparing Service Areas"
                compare (gc m7.tmp) (gc n7.tmp)

                BOX "Comparing Kernel Modules"
                compare (gc m8.tmp) (gc n8.tmp)

                BOX "Comparing Some File System Areas"
                compare (gc m9.tmp) (gc n9.tmp)                

                DONE

                pause
           }

            '4' {
                cls
                BOX "Deleting tmp files in local directory"
                Remove-Item n*.tmp, m*.tmp
                DONE
                pause
           }  
           
           'q' {
                BOX 'Please send $9.95 to AMP Associates P.O. Box 13470 for technical support and updates!'
                return
           }
     }
}
until ($option -eq 'q')