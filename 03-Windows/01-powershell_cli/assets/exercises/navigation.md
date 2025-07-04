# Powershell Navigation

Now we will learn how to move around in the filesystem with `Set-Location`, `Get-Location`, `Get-ChildItem` ...

- Print your current location on the screen
- Print the content of your current directory
- Print the content of your root (`C:` _if you're running windows_, `/` _for linux_)
- Go into your home folder (_C:\Users\Username or /home/Username_)
- Print the content of your home
- Those commands are pretty long to type, do you know any shorter way to do it?

# 📁 PowerShell Navigation – Answers

## ✅ Print your current location on the screen

```powershell
Get-Location
```

📍 This shows the current working directory (like `C:\Users\Username`).

---

## ✅ Print the content of your current directory

```powershell
Get-ChildItem
```

or simply:

```powershell
ls
```

📄 Lists all files and folders in the current location.

---

## ✅ Print the content of your root

```powershell
Get-ChildItem C:\
```

or:

```powershell
ls C:\
```

🗂️ Shows the contents at the root of the `C:` drive (or `/` on Linux).

---

## ✅ Go into your home folder

```powershell
Set-Location $HOME
```

or if you want to type the full path:

```powershell
Set-Location C:\Users\<YourUsername>
```

🏠 This navigates to your home directory.

---

## ✅ Print the content of your home

```powershell
Get-ChildItem $HOME
```

or:

```powershell
ls $HOME
```

📄 Displays files and folders in your home directory.

---

## ✅ Those commands are pretty long to type, do you know any shorter way to do it?

Yes! PowerShell supports **aliases** (shortcuts):

| Long Command         | Alias  | Description                    |
|----------------------|--------|--------------------------------|
| `Set-Location`       | `cd`   | Change directory               |
| `Get-Location`       | `pwd`  | Print working directory        |
| `Get-ChildItem`      | `ls`   | List directory contents        |

✅ So instead of:

```powershell
Set-Location $HOME
```

You can write:

```powershell
cd
```

*(which by default takes you to your home directory)*
