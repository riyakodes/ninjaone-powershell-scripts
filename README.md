# ninjaone-powershell-scripts
I wrote these scrips to automate deployment/ patching across 200+ devices. 


## 🧩 How I Run My PowerShell Scripts in NinjaOne

I usually run my PowerShell scripts directly from **NinjaOne**.  
Here’s exactly how I do it step-by-step 👇  

1. **Open NinjaOne** and log in to the dashboard.  
2. Go to the **Automation** section on the left-hand menu.  
3. Click on **Scripting**.  
4. Click the blue **“Add Script”** button.  
5. In the pop-up window:
   - **Name:** Give your script a clear name (example: “Clean Temp Files”).  
   - **Category:** Pick a category (like *Maintenance* or *Custom*).  
   - **Language:** Select **PowerShell**.  
   - **Operating System:** Choose **Windows** (or whichever applies).  
6. Copy your PowerShell code from your `.ps1` file and **paste it** into the script box.  
7. (Optional) If you want to run it with admin rights, check ✅ **Run as System**.  
8. Click **Save**.  

---

### ▶️ To Run It on Devices

1. Go to **Devices** in NinjaOne.  
2. Select the computers or servers you want to run the script on.  
3. Click the **“Run Script”** option (the little play ▶️ icon).  
4. Choose your script from the list.  
5. Click **Run Now** (or **Schedule** if you want it to run later).  
6. Watch the output or results in the **Activity Log** or **Script Results** section.  

---

### 💡 Notes
- Always test new scripts on one device before deploying to many.  
- You can schedule recurring scripts under **Policies → Scheduled Actions**.  
- Use the **Script Output** section in NinjaOne to see if your script succeeded or failed.

---

This is the exact process I follow for all my PowerShell automation tasks in NinjaOne. 🚀
