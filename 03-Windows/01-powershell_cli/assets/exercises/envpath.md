# Powershell Environment Variables

In any programming language you can store data within variables. However they only exist as long as the program is executed, but what if you wanted to share information between two applications not running at the same time.

Then you could use environment variables, which are variables stored at the OS level. You can access them from anywhere.

- Open a Powershell Terminal
- Type `echo $env:computername`. It should show your computer name
- Create a variable by typing `$env:test = "hello powershell"`
- Check the variable you just created the same way you did with the computer name
- Now we will add something to this variable by typing `$env:test += " Becode"`
- Check the variable
- There is one really important environment variable : `$env:path`. This variable store the location where windows looks for files that are not in your current folder. For example, if you call VSCode from the powershell terminal, it opens it even if the executable isn't present in the current folder. That's because the path to the vscode's executable is stored in `$env:path`. Now download an executable software ([rufus](https://github.com/pbatard/rufus/releases/download/v3.13/rufus-3.13p.exe) for example) and copy it on your desktop. If you try from a command line to launch it, it will fail with a command not found (if you are not in the same folder).
- Try to happen the $env:path to add the path to rufus' executable (It should be something like this if you copied it on your desktop : `C:\Users\Username\Desktop`)
- Try to call rufus from anywhere
- I would like you to have a look at [the recognized environment variables available on windows](https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables).
- Write a small script reporting your computer specs and convert it in a csv file. You might have some trouble executing your script once saved. Why? How can you change it in a secure way?

> **WARNING**: This exercise will **only work on windows** since it's specific to the way windows manages environment variables.

# 🌍 PowerShell Environment Variables – Answers

> ⚠️ WARNING: This exercise only works on **Windows** as it relies on how the OS manages environment variables.

---

## ✅ Open a PowerShell Terminal

Done ✅

---

## ✅ Show your computer name

```powershell
echo $env:COMPUTERNAME
```

🖥️ Outputs the name of your computer.

---

## ✅ Create a variable

```powershell
$env:test = "hello powershell"
```

---

## ✅ Check the variable

```powershell
echo $env:test
```

➡️ Output: `hello powershell`

---

## ✅ Append " Becode" to this variable

```powershell
$env:test += " Becode"
```

---

## ✅ Check the updated variable

```powershell
echo $env:test
```

➡️ Output: `hello powershell Becode`

---

## ✅ `$env:PATH` variable explanation

The `$env:PATH` environment variable stores locations that Windows checks when running a command, like `code` for VSCode.

---

## ✅ Add path to Rufus (or any executable copied to Desktop)

Assuming you copied the executable to Desktop:

```powershell
$env:Path += ";C:\Users\<YourUsername>\Desktop"
```

📂 Replace `<YourUsername>` with your actual Windows user name.

Now you can run `rufus` from any PowerShell location.

---

## ✅ List all recognized environment variables

```powershell
Get-ChildItem Env:
```

🧭 Displays all current environment variables.

---

## ✅ Write a script that reports computer specs and exports to CSV

Create `report.ps1` with:

```powershell
$report = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    Username     = $env:USERNAME
    OS           = (Get-CimInstance Win32_OperatingSystem).Caption
    CPU          = (Get-CimInstance Win32_Processor).Name
    RAM_GB       = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
}

$report | Export-Csv -Path specs.csv -NoTypeInformation
```

---

## ❓ Why might it fail to execute?

By default, PowerShell **restricts script execution** for security reasons.

You might get an error like:

> `script.ps1 cannot be loaded because running scripts is disabled on this system.`

✅ To fix this securely for your user only:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

Let me know if you'd like to export this to a markdown file!

