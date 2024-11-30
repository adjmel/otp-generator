# OTP Generator with Encrypted Key Storage

This Python script is an implementation of a Time-based One-Time Password (TOTP) generator using the HMAC-SHA1 algorithm. The key used for generating the OTP is securely stored in an encrypted file. The script supports two main operations:

1. **Generate and store an encrypted key** using a 64-character hexadecimal key.
2. **Generate an OTP** using the stored or provided key based on the current timestamp.

## Features

- **Encrypted Key Storage:** The script stores the OTP key in an encrypted file, ensuring that the key is not stored in plaintext.
- **OTP Generation:** Based on the TOTP algorithm, an OTP is generated every 30 seconds using the stored or provided key.
- **Time-based OTPs (TOTP):** The OTP is generated based on the current time, making it valid only for a short period.
- **HMAC-SHA1 Algorithm:** The OTP generation uses HMAC with SHA-1 for secure hashing.

## Requirements

- Python 3.x
- Required Python libraries:
  - **cryptography**: For key encryption and decryption.

### To install the necessary Python libraries, run:
```bash
pip install cryptography
```

## Usage

The script supports two operations controlled by command-line arguments:

1. **Generate and store the key (encrypted):**
    - Use this operation to generate an encrypted key and store it in a file.
    - Syntax:
      ```bash
      python otp_generator.py -g <hexadecimal_key>
      ```

2. **Generate OTP:**
    - This operation generates a One-Time Password (OTP) based on the stored key or a provided key.
    - Syntax:
      ```bash
      python otp_generator.py -k <encrypted_key_or_file>
      ```

### Example Commands

#### 1. Generate and store an encrypted key
```bash
python otp_generator.py -g <your_64_hexadecimal_key>
```

This will store the provided hexadecimal key in an encrypted file `ft_otp.key`.

Example:
```bash
python otp_generator.py -g abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
```

#### 2. Generate OTP from the stored or provided key
```bash
python otp_generator.py -k <encrypted_key_or_file>
```

This will load the encrypted key (from the file `ft_otp.key` by default or from a provided key), decrypt it, and generate a Time-based OTP.

Example:
```bash
python otp_generator.py -k ft_otp.key
```

If you want to provide a raw key directly (64-character hexadecimal):
```bash
python otp_generator.py -k abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
```

### OTP Format
The generated OTP is a 6-digit number. You can adjust the number of digits by modifying the `digits` parameter in the script. By default, the script generates a 6-digit OTP.

### Output
If the OTP generation is successful, it will print the 6-digit OTP to the console. Example output:
```bash
123456
```

### Error Handling
- **Invalid Key:** If the provided key is not 64 characters long or contains invalid characters (anything other than hexadecimal characters), the script will raise an error and exit.
- **File Not Found:** If the provided file does not exist or the file is corrupt, an error message will be shown.

### Examples of Output

1. **Key Storage Success:**
   ```bash
   Key was successfully saved in ft_otp.key.
   ```

2. **OTP Generation:**
   ```bash
   123456
   ```

3. **Error in Key Validation (if key is not 64 hexadecimal characters):**
   ```bash
   error: key must be 64 hexadecimal characters.
   ```

4. **Usage Message (when arguments are missing or invalid):**
   ```bash
   Usage:
    -g <hexadecimal_key> to generate and store the key
    -k to generate an OTP code
   ```

## Script Functions

1. **save_encrypted_key(hex_key):**  
   - Encrypts the provided 64-character hexadecimal key and saves it to a file (`ft_otp.key`).
   - If the file already exists, it will read and decrypt the stored key.

2. **load_encrypted_key(key_or_file):**  
   - Loads the key from the file `ft_otp.key` (or another file) and decrypts it, returning the original 64-character hexadecimal key.

3. **generate_otp(key, counter, digits=6):**  
   - Generates a Time-based OTP using the provided key and a counter (based on the current timestamp divided by 30 seconds).

4. **main():**  
   - Handles command-line argument parsing and controls the execution flow (generating and storing keys or generating OTPs).

