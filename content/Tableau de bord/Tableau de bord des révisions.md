---
repeat: never
---
# Révisions

---

## 🔥 Notes non suivies
```dataview
TABLE repeat.next as "À revoir"
FROM ""
WHERE repeat.next <= date(today)
SORT repeat.next ASC
```


## ⏳ Révisions à venir
 ```dataview
TABLE due_at AS "Revoir le"
 FROM ""
 WHERE due_at AND date(due_at) > date(today)
 SORT due_at ASC
 ```
 
 

 

## 📝 Notes planifiées récemment
```dataview
TABLE due_at AS "Échéance"
FROM ""
WHERE due_at
SORT due_at DESC
```

