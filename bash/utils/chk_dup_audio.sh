#!/usr/bin/env bash
python3 $HOME/.scripts/python/dedupe_audio.py "$HOME/sea2tb/Music/" "$HOME/wd2tb/music" --workers=8 | tee ~/logs/dedupe_dryrun_$(date +%Y%m%d).log
