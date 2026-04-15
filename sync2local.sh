# load .env
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo .env file required for path definitions
  exit 1
fi

rsync() {
  if [ -z "$RUN" ]; then
    command rsync --dry-run "$@"
    echo set RUN to run command
  else
    command rsync "$@"
  fi
}

rsync --archive --verbose --delete \
  --exclude .venv \
  --exclude .git \
  --exclude .ruff-cache \
  hpc:$HPC $LOCAL
