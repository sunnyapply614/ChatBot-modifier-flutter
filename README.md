
## Cloning Github Folder into VPS (Using Git Sparse-Checkout)

**1. Initialize a New Git Repository:**  
Create a new directory and initialize a Git repository:  
```
git init  
```  
**2. Set Up Sparse Checkout:**  
```
git remote add origin https://github.com/sunnyapply614/ChatBot-modifier-flutter.git 
git config core.sparseCheckout true  
```
 
**3. Specify the Folder to Clone:**  
``` 
Create a .git/info/sparse-checkout file and add the paths to the directories you want to clone.
echo "" >> .git/info/sparse-checkout  
```
  
**4. Pull the Repository:**  
```
git pull origin main  
```  


## Deploy Front-End

```
cd 
yarn instal

npm run build
```
Move all files from build directory
