#### Description

    {
        "name": "Remove Duplicate Lines CSV",
        "image": "platonam/lopco-remove-duplicate-lines-csv-worker:latest",
        "data_cache_path": "/data_cache",
        "description": "Remove dupclicated lines from a Comma-Separated Values file.",
        "configs": {
            "delimiter": null,
            "time_column": null,
            "time_format": null
        },
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

For the timestamp format as required by `time_format` please use these [format codes](https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes).