# CSV-Data-Validator-and-Cleaner

This project consists of a series of Bash scripts to validate and clean CSV files. The scripts check for:
1. Missing fields
2. Invalid age values
3. Invalid email formats

### **Folder Structure**
1. wrapper.sh # Main script to run all validations
2. validate-missing-fields.sh # Script to validate missing fields
3. invalid-age-fields.sh # Script to validate invalid age fields
4. invalid-email-fields.sh # Script to validate invalid email fields
5. sample.csv # Example input CSV file
6. output.csv # Example output CSV file after running the scripts
7. README.md # Project documentation

### **Scripts Description**

1. **wrapper.sh**
   - The main script that orchestrates the other validation scripts.
   - Usage: `./wrapper.sh <input_file> <output_file>`

2. **validate-missing-fields.sh**
   - Validates for missing fields.
   - Appends invalid rows to the output file.
   - Usage: `./validate-missing-fields.sh <input_file> <output_file>`

3. **invalid-age-fields.sh**
   - Validates age fields (must be numeric and in the range 10-99).
   - Appends invalid rows to the output file.
   - Usage: `./invalid-age-fields.sh <input_file> <output_file>`

4. **invalid-email-fields.sh**
   - Validates email fields (must end with `.com`, `.org`, or `.net`).
   - Appends invalid rows to the output file.
   - Usage: `./invalid-email-fields.sh <input_file> <output_file>`

### **How to Run**
1. Place your input CSV file (e.g., `sample.csv`) in the project directory.
2. Run the wrapper script: ./wrapper.sh sample.csv output.csv
