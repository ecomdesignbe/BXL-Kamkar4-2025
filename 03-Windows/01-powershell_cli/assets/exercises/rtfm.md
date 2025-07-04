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

## 🔹 Étape 1 : Ouvrir une session PowerShell

Lance PowerShell (ou Windows Terminal avec un onglet PowerShell).

---

## 🔹 Étape 2 : Taper `Get-Help`

```powershell
Get-Help
```

Affiche les options générales d’aide disponibles dans PowerShell :
- `-Full`
- `-Detailed`
- `-Examples`
- `-Online`

---

## 🔹 Étape 3 : Découvrir ce que fait `Get-Process`

```powershell
Get-Help Get-Process
```

> Gets the processes that are running on the local computer or on a remote computer.

🔍 Autres options utiles :

```powershell
Get-Help Get-Process -Detailed
Get-Help Get-Process -Examples
```

---

## 🔹 Étape 4 : Utiliser l’aide en ligne

```powershell
Get-Help Get-Process -Online
```

Cela ouvrira la documentation officielle dans ton navigateur.

---

## 🔹 Étape 5 : Tester `Get-Command`

```powershell
Get-Command
```

Permet de lister toutes les commandes disponibles.

Exemples :

```powershell
Get-Command Get-*
Get-Command -Name *process*
```

---

## 🔹 Étape 6 (Optionnel) : Aide sur les commandes classiques (ls, cp, mv…)

| Commande Linux | Alias PowerShell | Cmdlet équivalente         |
|----------------|------------------|-----------------------------|
| `ls`           | `ls`             | `Get-ChildItem`             |
| `cp`           | `cp`             | `Copy-Item`                 |
| `mv`           | `mv`             | `Move-Item`                 |
| `rm`           | `rm`             | `Remove-Item`               |
| `cat`          | `cat`            | `Get-Content`               |

Tu peux tester :

```powershell
Get-Help ls
Get-Help Get-ChildItem -Examples
```

---

## ✅ Résumé des commandes utiles

```powershell
Get-Help <cmdlet> -Examples      # Voir des exemples
Get-Help <cmdlet> -Detailed      # Description détaillée
Get-Help <cmdlet> -Online        # Documentation officielle
Get-Command <mot-clé>            # Chercher une commande
```
