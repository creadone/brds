# BRDS

Utility makes directories structure backup or recovery.
The main feature is to save structure to YAML file as list of directories and metadata.

## Installation

1. Clone repo `git clone https://github.com/creadone/brds.git`
2. Install dependencies `cd brds && shards`
3. Build release `crystal build --release ./src/brds.cr -o ./dist/brds`

## Usage

See `./brds --help` for manual page.

How to:
```
  ./brds [flags...] [arg...]

Backup and recovery directories structure

Flags:
  --file, -f (default: backup.yaml)  # Backup or recovery source file
  --help (default: false)            # Display help for the current command
  --list, -m (required)              # Work mode (backup | recovery)
  --target, -t (default: ./)         # Path to directory where backup or recovery process will start
```

* To make backup: `./brds -m backup -f /path/to/backup.yaml -t /dirs/to/backup`
* To recover from backup: `./brds -m recovery -f /path/to/backup.yaml -t /path/to/recovery/dirs`

## Contributing

1. Fork it ( https://github.com/creadone/brds/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [creadone](https://github.com/creadone) - owner, maintainer
