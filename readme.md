# Continuous File Synchronization Script

**Description:**

This Bash script efficiently synchronizes files between two directories using `rsync` and `inotifywait`. It continuously monitors the source directory for changes and automatically triggers an `rsync` transfer when modifications, creations, deletions, or moves occur. The script includes features for compression, progress tracking, partial transfer handling, in-place updates, and extraneous file deletion.

**Usage:**

1. **Make it executable:** Use `chmod +x sync.sh` to grant execute permissions.
2. **Run the script:** Execute the script using `./sync_files.sh`.
3. **Provide paths:** The script will prompt you for the source and destination directories.

**Features:**

- **Continuous synchronization:** Monitors for changes and updates files in real-time.
- **Efficient rsync options:** Optimizes transfer speed and preserves file integrity.
- **User-friendly input:** Guides the user to provide valid directory paths.
- **Clear output:** Displays progress and results of the synchronization process.

**Considerations:**

- **Security:** For sensitive data, implement authentication or encryption mechanisms.
- **Error handling:** Consider adding error handling to address potential issues like network errors or disk space problems.
- **Logging:** Implement logging to track synchronization events and troubleshoot issues.

**Additional Notes:**

- **Dependencies:** Requires `rsync` and `inotifywait` to be installed.
- **Customization:** Adjust `rsync` options as needed for specific requirements.
