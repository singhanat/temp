# temp
สรรพสิ่งล้วนชั่วคราว

### Music File Renamer

A PowerShell script to remove duplicate markers (e.g., " (2)") from music filenames.

### การใช้งาน (Usage)

คุณสามารถรันสคริปต์ผ่าน PowerShell โดยระบุ Path ของโฟลเดอร์ที่ต้องการแก้ไข:

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\Remove-DuplicateMusicMarkers.ps1 -Path "C:\Users\richm\Music\THAI_RETRO"
```

### พารามิเตอร์
- `-Path`: Full Path ของโฟลเดอร์ที่มีไฟล์เพลง
