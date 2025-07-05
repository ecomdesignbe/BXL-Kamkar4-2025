# Powershell Permissions

Now that we can navigate and create files, we should be able to change permissions on these. We will use the commands `Get-Acl`, `Set-Acl`, `RunAs`

- Create a file
- Check the owner and the groups
- Change the file owner to the built-in administrator (administrator account is disabled by default, check how to enable it. Don't forget to set a strong password!)
- Check the file's permission
- Try to print the content of the file as your normal user
- Print the content of the file using administrator account

> **WARNING**: This exercise **will only work on Windows** system since file system permissions are not managed the same way on Windows and Linux.

# 🔐 PowerShell Permissions – Answers

> ⚠️ Note: This exercise only works on **Windows** due to how NTFS permissions are handled.

---

## ✅ Create a file

```powershell
New-Item -Path secure.txt -ItemType File
```

---

## ✅ Check the owner and the groups

```powershell
Get-Acl secure.txt | Format-List
```

📄 This shows:
- File owner
- Access Control List (ACL) with groups and permissions

---

## ✅ Change the file owner to the built-in Administrator

1. **Enable the Administrator account** (if disabled):

```powershell
net user administrator /active:yes
```

2. **Set a strong password**:

```powershell
net user administrator "Str0ngP@ssw0rd!"
```

3. **Take ownership** (as Administrator):

```powershell
takeown /f secure.txt
```

4. **Change owner to Administrator explicitly** (optional, using `Set-Acl` requires more steps with `System.Security.Principal.NTAccount`)

---

## ✅ Check the file's permission again

```powershell
Get-Acl secure.txt | Format-List
```

🔍 Ensure the **owner** is now `Administrator`.

---

## ✅ Try to print the content of the file as your normal user

```powershell
Get-Content secure.txt
```

❌ If permission is denied, you’ll see an error like:
> Access to the path 'secure.txt' is denied.

---

## ✅ Print the content of the file using Administrator account

1. Open a new PowerShell **as Administrator**  
2. Run:

```powershell
Get-Content secure.txt
```

✅ The content should now be displayed successfully.

---

Let me know if you want this exported as a markdown file too!
