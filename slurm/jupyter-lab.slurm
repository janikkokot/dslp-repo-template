#! /bin/bash
#SBATCH --job-name=JupyterLabServer
#SBATCH --partition=small_jobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=16G
#SBATCH --time=08:00:00
#SBATCH --output=./slurm/log/%j.log

ln -sf slurm/log/$SLURM_JOB_ID.log slurm/latest.log

PORT=8888

echo "Starting on: $SLURM_JOB_NODELIST"
echo "ssh -N -L ${PORT}:${HOSTNAME}.i-med.ac.at:${PORT} hpc"
uv run jupyter lab --no-browser --port=${PORT} --ip=${HOSTNAME}.i-med.ac.at
# uv run python -m http.server ${PORT}
echo Finishing
