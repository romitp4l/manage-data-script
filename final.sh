#!/bin/bash

# Specify the list of registration numbers
registration_numbers=("10001123" "10001140" "10001141" "10001149" "10001171" "10001177" "10001252")

# Iterate through each registration number
for registration_number in "${registration_numbers[@]}"; do
    # Create a new folder with the "final" suffix
    final_folder="${registration_number}final"
    mkdir "$final_folder"

    # Iterate through subfolders
    for folder in ${registration_number}*; do
        # Check if it's a directory and starts with the registration number
        if [ -d "$folder" ] && [[ "$folder" == "${registration_number}"* ]]; then
            # Move all files from the subfolder to the "final" folder
            find "$folder" -type f -exec mv {} "$final_folder/" \;

            # Remove the original subfolder if it's not the final folder
            if [ "$folder" != "$final_folder" ]; then
                rm -r "$folder"
            fi
        fi
    done

    echo "Files for registration number $registration_number moved to $final_folder, and original subfolders deleted."
done
