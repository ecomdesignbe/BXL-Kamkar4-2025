# Powershell RTFM

Everybody needs a little help at one time or another. In this exercise we will check how you can get help on powershell and how you can find interesting commands following your needs.

- Open a PowerShell session in your terminal
- type `Get-Help`
- Find out what a command such as `Get-Process` does without looking on google
- Now try with the `-online` parameter
- What does `Get-command`? 

Optionally:

- Try to get help on common commands such as `ls`, `cp`, `mv`, ...

---

# 💻 PowerShell RTFM – Answers

## ✅ Open a PowerShell session in your terminal

✅ Done: Opened PowerShell via the Start menu or through Windows Terminal.

---

## ✅ Type `Get-Help`

```powershell
Get-Help
```

📘 This command displays a guide on how to use the help system in PowerShell. It shows that you can use parameters like:
- `-Name`: get help on a specific command
- `-Examples`: see practical usage examples
- `-Detailed`: show a detailed description
- `-Online`: open the official documentation in your browser

---

## ✅ Find out what a command such as `Get-Process` does **without using Google**

```powershell
Get-Help Get-Process
```

📄 **Output**:  
`Get-Process` gets the processes that are currently running on the local computer or a remote one if specified.

> "Gets the processes that are running on the local computer or on a remote computer."

🔎 For more detailed info:

```powershell
Get-Help Get-Process -Examples
```

---

## ✅ Try with the `-Online` parameter

```powershell
Get-Help Get-Process -Online
```

🌐 This opens the official Microsoft documentation for `Get-Process` in your default browser.

---

## ✅ What does `Get-Command` do?

```powershell
Get-Command
```

🔧 This command lists **all available PowerShell commands** in your current session.

You can filter it with:
- `-Name` to search by name
- `-Verb` or `-Noun` for more specific queries
- Wildcards like `Get-*` to narrow down the list

Example:

```powershell
Get-Command -Name *process*
```

👉 Lists all commands related to processes.

---

## 🔹 Optionally: Try to get help on common commands like `ls`, `cp`, `mv`, ...

You can get help for commonly used aliases (often from Linux):

```powershell
Get-Help ls     # Get-ChildItem
Get-Help cp     # Copy-Item
Get-Help mv     # Move-Item
Get-Help rm     # Remove-Item
Get-Help cat    # Get-Content
```

💡 PowerShell uses aliases to make the transition from bash easier.

---

## ✅ Quick Summary

| Command           | Function                                   |
|-------------------|--------------------------------------------|
| `Get-Help`        | Get general or specific help               |
| `Get-Process`     | List currently running processes           |
| `Get-Command`     | Discover available commands                |
| `Get-Help <cmd> -Online` | Open official help in browser     |
| `ls`, `cp`, `mv`  | Aliases for common PowerShell cmdlets      |

