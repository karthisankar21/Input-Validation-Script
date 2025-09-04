# Input Validation Script

This Bash script validates command-line inputs for **environment**, **region**, and **zone** based on predefined rules.  

## 🎯 Features
- Accepts inputs for:
  - **Environment** → `deployment`, `staging`, `production`
  - **Region** → `america`, `india`
  - **Zone** (depends on region):
    - If region is `america` → `america-1`, `america-2`
    - If region is `india` → `india-1`, `india-2`
- Validates the provided arguments.
- Displays meaningful error messages if validation fails.
- Ensures only correct combinations of environment, region, and zone are allowed.

---

## 🚀 Usage

Make the script executable:
```bash
chmod +x validate.sh
```

Run with the following options:
```bash
./validate.sh -e <environment> -r <region> -z <zone>
```

Options
 -  -e, --environment → Environment (deployment, staging, production)
 -  -r, --region → Region (america, india)
 -  -z, --zone → Zone (america-1, america-2, india-1, india-2)

Valid Inputs
```bash
  - ./validate.sh -e deployment -r america -z america-1
  - ./validate.sh --environment staging --region india --zone india-2
```
Output
```bash
  - environment: deployment
  - region: america
  - zone: america-1
All inputs are valid.
```

Invalid Inputs
```bash
./validate.sh -e dev -r america -z america-1
```
Output
```bash
Invalid environment. Choose from: deployment staging production
```
---
⚡ Notes
  - Argument parsing is handled using getopt.
  - Script exits with a non-zero status on validation errors.
  - You must always provide all three arguments (environment, region, zone).
---
