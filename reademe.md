# QA Automation with Robot Framework

## 1. การสร้าง Python Virtual Environment (.venv)

1. เปิด Command Prompt ที่โฟลเดอร์โปรเจกต์นี้
2. สร้าง virtual environment ด้วยคำสั่ง:
   ```
   python -m venv .venv
   ```
3. ติดตั้ง dependencies ที่จำเป็น:
   ```
   .venv\Scripts\activate
   pip install -r requirements.txt
   ```

## 2. การ Activate/Deactivate .venv

- **Activate** (Windows):
  ```
  .venv\Scripts\activate
  ```
- **Deactivate**:
  ```
  deactivate
  ```

## 3. การรัน Robot Framework

### 3.1 รันทั้งไฟล์

```
robot Browser\saucedemo.robot
```

### 3.2 รันเฉพาะ test case ที่ต้องการ (โดยใช้ --test หรือ -t)

```
robot -t "ชื่อของ test case" Browser\saucedemo.robot
```
ตัวอย่าง:
```
robot -t "buy Sauce Labs Fleece Jacket" Browser\saucedemo.robot
```

### 3.3 รันด้วย tag (โดยใช้ --include หรือ -i)

```
robot -i ชื่อtag Browser\saucedemo.robot
```
ตัวอย่าง:
```
robot -i "buy Sauce Labs Fleece Jacket" Browser\saucedemo.robot
```

### 3.4 รันโดยเปลี่ยนค่า Variables ด้วย -v (ตัวอย่างสำหรับ google_search_2.robot)

เช่น ต้องการเปลี่ยน URL หรือ BROWSER ขณะรัน test case:

```
robot -v URL:https://www.bing.com "Search on Google/google_search_2.robot"
```

หรือเปลี่ยน browser เป็น edge:

```
robot -v BROWSER:edge "Search on Google/google_search_2.robot"
```

- ผลลัพธ์การรันจะอยู่ในโฟลเดอร์ `results/` หรือไฟล์ `log.html`, `report.html`, `output.xml`

