<?php
$backup_file = 'backup_' . date('Y-m-d_H-i-s') . '.sql';
$command = "mysqldump -u root -p inventory_db > $backup_file";
system($command, $output);
if ($output === 0) {
    echo "Backup successful. File: $backup_file";
} else {
    echo "Backup failed!";
}
?>
