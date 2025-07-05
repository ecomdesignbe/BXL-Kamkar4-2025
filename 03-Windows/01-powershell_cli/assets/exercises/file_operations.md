# Powershell File Operations

Now that we know how to move in the file system, let's check how to manipulate files and folders. In this challenge, you will discover and use the commands `Get-Content`, `echo`, `New-Item`, `Move-Item`, `Copy-Item`, and `Remove-Item`.

- Create a file named story1.txt
- Type `echo "Hello World" > story1.txt`
- Print the content of the file
- Create a folder named `story`
- Move `story1.txt` inside `story`
- Copy `story1.txt` as `story2.txt`
- Print both files
- Rename `story2.txt` as `me.txt`
- Append `me.txt` and add "I am a junior at Becode"
- Remove the folder story with it's content


# 📝 PowerShell File Operations – Answers

## ✅ Create a file named `story1.txt`

```powershell
New-Item -Path story1.txt -ItemType File
```

or using redirection:

```powershell
echo "Hello World" > story1.txt
```

---

## ✅ Print the content of the file

```powershell
Get-Content story1.txt
```

---

## ✅ Create a folder named `story`

```powershell
New-Item -Path story -ItemType Directory
```

---

## ✅ Move `story1.txt` inside `story`

```powershell
Move-Item story1.txt story/
```

---

## ✅ Copy `story1.txt` as `story2.txt`

```powershell
Copy-Item story/story1.txt story/story2.txt
```

---

## ✅ Print both files

```powershell
Get-Content story/story1.txt
Get-Content story/story2.txt
```

---

## ✅ Rename `story2.txt` as `me.txt`

```powershell
Rename-Item story/story2.txt story/me.txt
```

---

## ✅ Append to `me.txt` and add `"I am a junior at Becode"`

```powershell
Add-Content story/me.txt "I am a junior at Becode"
```

---

## ✅ Remove the folder `story` with its content

```powershell
Remove-Item story -Recurse -Force
```

