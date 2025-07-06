# Exercise Powershell CLI - Trial of might

Now that you gathered some basic understanding of the Powershell CLI, here is an exercise to test your might! It's been put together by the guys at [UnderTheWire](https://underthewire.tech/) (_very similar to OverTheWire_). You will have to tackle a series of exercise called Century that is aimed at testing the fundamentals of Powershell know-hows.

- Go to the webpage of the [Century game](https://underthewire.tech/century) and follow the instructions there
- **complete a maximum amount of levels** and **take note of the passwords** for each one of them
- First level:  ```century1@century.underthewire.tech``` 
- Password: ```century1```
- Encrypt the collected passwords with [GPG](https://medium.com/meetcyber/gpg-encryption-a-comprehensive-guide-to-securing-data-transfers-b66e784d7889), upload them on Github (link to be provided later) with a minimalist readme and send me your public key. 

# 💻 PowerShell Trial Of Might – Answers

<<<<<<< HEAD
- century0: ```century1``` \
- century1: ```10.0.14393.7870```  
- $PSVersionTable.BuildVersion \

- century2: ```invoke-webrequest443```  
- Get-Command *request*
- Get-ChildItem \

- century3: ```123```  
- (Get-ChildItem | Where-Object { -not $_.PSIsContainer } | Measure-Object).Count \

- century4: ```15768```  
- Get-ChildItem -Recurse | Where-Object { -not $_.PSIsContainer } | Select-Object -ExpandProperty Name \

- century5: ```underthewire3347```  
- (Get-ADDomain -Current LocalComputer).name
- Get-ChildItem \

- century6: ```197```  
- (Get-ChildItem).Count \

- century7: ```7points```  
- Get-ChildItem -Recurse
- Get-Alias cat
- Get-Content .\Readme.txt \

- century8: ```696```  
- (Get-Content .\unique.txt | Get-Unique).count \

- century9: ```pierid```  
- ($words = (Get-Content Word_file.txt) -join " ") -split "\s+" | Select-Object -Index 160
- Get-ChildItem
- Get-Content .\Word_File.txt
- (Get-Content .\Word_File.txt) -split ' ' | Select-Object -Index 160 \

- century10: ```windowsupdates110```  
- Get-Service wuauserv
- Get-Service wuauserv | Select-Object *
- $desc = (Get-WmiObject -Query "select * from win32_service where name = 'wuauserv'" | Select-Object *).Description
- $desc -split ' ' | Select-Object -Index 9
- $desc -split ' ' | Select-Object -Index 7
- Get-ChildItem \

- century11: ```secret_sauce```  
- Get-ChildItem -Force -Recurse -Hidden -ErrorAction SilentlyContinue
- Get-ChildItem -Recurse -Hidden -File -ErrorAction SilentlyContinue -Name Desktop, Documents, Downloads, Favorites, Music, Videos \

- century12: ```i_authenticate_things```  
- Get-ADDomainController
- Get-ADComputer -Identity "UTW" -Properties Description
- Get-ChildItem \

- century13: ```755```  
- Get-ChildItem
- $words = (Get-Content .\countmywords) -split ' '
- $words.count \

- century14: ```153```  
- Get-ChildItem
- $words = (get-content .\countpolos) -split ' '
- $words | select-string -Pattern 'polo'
- $count = ($words | select-string -Pattern \bpolo\b).Count
- $count
=======
---

## 🏛️ century0: `century1`

```powershell
$PSVersionTable.BuildVersion
```

**Answer:** `10.0.14393.7870`

---

## 🏛️ century1: `invoke-webrequest443`

```powershell
Get-Command request
Get-ChildItem
```

---

## 🏛️ century2: `123`

```powershell
(Get-ChildItem | Where-Object { -not $_.PSIsContainer } | Measure-Object).Count
```

---

## 🏛️ century3: `15768`

```powershell
Get-ChildItem -Recurse | Where-Object { -not $_.PSIsContainer } | Select-Object -ExpandProperty Name
```

---

## 🏛️ century4: `underthewire3347`

```powershell
(Get-ADDomain -Current LocalComputer).name
Get-ChildItem
```

---

## 🏛️ century5: `197`

```powershell
(Get-ChildItem).Count
```

---

## 🏛️ century6: `7points`

```powershell
Get-ChildItem -Recurse
Get-Alias cat
Get-Content .\Readme.txt
```

---

## 🏛️ century7: `696`

```powershell
(Get-Content .\unique.txt | Get-Unique).count
```

---

## 🏛️ century8: `pierid`

```powershell
$words = (Get-Content Word_file.txt) -join " "
$words -split "\s+" | Select-Object -Index 160
```

---

## 🏛️ century9: `windowsupdates110`

```powershell
Get-Service wuauserv
Get-Service wuauserv | Select-Object *

$desc = (Get-WmiObject -Query "select * from win32_service where name = 'wuauserv'" | Select-Object *).Description
$desc -split ' ' | Select-Object -Index 9
$desc -split ' ' | Select-Object -Index 7

Get-ChildItem
```

---

## 🏛️ century10: `secret_sauce`

```powershell
Get-ChildItem -Force -Recurse -Hidden -ErrorAction SilentlyContinue
Get-ChildItem -Recurse -Hidden -File -ErrorAction SilentlyContinue -Name Desktop, Documents, Downloads, Favorites, Music, Videos
```

---

## 🏛️ century11: `i_authenticate_things`

```powershell
Get-ADDomainController
Get-ADComputer -Identity "UTW" -Properties Description
Get-ChildItem
```

---

## 🏛️ century12: `755`

```powershell
Get-ChildItem

$words = (Get-Content .\countmywords) -split ' '
$words.Count
```

---

## 🏛️ century13: `153`

```powershell
Get-ChildItem

$words = (Get-Content .\countpolos) -split ' '
$words | Select-String -Pattern 'polo'

$count = ($words | Select-String -Pattern '\bpolo\b').Count
$count
```

---
>>>>>>> 5d646cbe6c0cbf6e0994415fba0d4f9d10c802d8
