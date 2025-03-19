# GreenSort 🌿📂  

**GreenSort** is a PowerShell script that **automatically organizes Greenshot screenshots** by creating **yearly and monthly folders**, while Greenshot handles daily sorting.

## 🚀 Features
- 📆 **Automatically creates new month folders** (`C:\Screenshots\2025\3.March`).
- 📸 **Greenshot automatically saves images in daily folders** (`C:\Screenshots\2025\3.March\03-19`).
- 🔄 **Uses Windows Task Scheduler** to ensure monthly updates.
- 🛠 **Fully automated to set-it-and-forget-it yo**

## 📂 Folder Structure Example
C:\Screenshots\
│── 2025\
│   ├── 3.March\
│   │   ├── 03-18\
│   │   ├── 03-19\
│   │   ├── 03-20\
│   ├── 4.April\
│   │   ├── 04-01\
│   │   ├── 04-02\
*(Each month has a folder, and inside each month are daily folders for screenshots.)*

## 🛠 Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/K4FFEINE/GreenSort.git

## 📅 Automating GreenSort with Task Scheduler

To run GreenSort automatically each month:

1. Open **Task Scheduler** (`Win + R`, type `taskschd.msc`, press Enter).
2. Click **Create Basic Task** → Name it **GreenSort**.
3. Under **Trigger**, select **Monthly** and choose the 1st of each month.
4. Under **Action**, select **Start a program** and enter:
powershell.exe
5. In the **Add Arguments** box, enter:
-ExecutionPolicy Bypass -File "C:\Path\To\GreenSort.ps1"
*(Replace `"C:\Path\To\GreenSort.ps1"` with the actual location of the script on your system.)*
6. Click **Finish** to save the task.

Now, GreenSort will **run automatically at the start of each month!** 🎯

## ⚙️ Configuration

- If you move your **screenshot folder**, **edit GreenSort.ps1** and update the paths inside the script.
- Make sure Task Scheduler always points to the correct location of `GreenSort.ps1`.
