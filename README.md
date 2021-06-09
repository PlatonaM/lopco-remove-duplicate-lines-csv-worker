## lopco-remove-duplicate-lines-csv-worker

Remove duplicate lines a CSV file.

### Configuration

None

### Inputs

Type: single

`source_file`: CSV file with duplicate lines.

### Outputs

Type: single

`output_csv`: CSV file with unique lines.

### Description

    {
        "name": "Remove Duplicate Lines CSV",
        "image": "platonam/lopco-remove-duplicate-lines-csv-worker:latest",
        "data_cache_path": "/data_cache",
        "description": "Remove dupclicated lines from a Comma-Separated Values file.",
        "configs": null,
        "input": {
            "type": "single",
            "fields": [
                {
                    "name": "source_file",
                    "media_type": "text/csv",
                    "is_file": true
                }
            ]
        },
        "output": {
            "type": "single",
            "fields": [
                {
                    "name": "output_csv",
                    "media_type": "text/csv",
                    "is_file": true
                }
            ]
        }
    }
