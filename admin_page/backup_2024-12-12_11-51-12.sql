<?php
// Database credentials
$host = 'localhost';
$username = 'root';
$password = '';
$dbname = 'inventory_db';

// Set filename for the backup
$backup_file = 'backup_' . date('Y-m-d_H-i-s') . '.sql';

// Command to export the database
$command = "mysqldump --user=$username --password=$password --host=$host $dbname > $backup_file";

// Execute the command
system($command, $output);

// Check if the backup was successful
if ($output === 0) {
    // Trigger download
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($backup_file) . '"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($backup_file));
    readfile($backup_file);
    exit;
} else {
    echo "Backup failed!";
}
?>
