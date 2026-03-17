# Switch wallpaper based on time of day.
#
# Environment variables:
#   MORNING_DIR       - directory containing morning wallpapers
#   AFTERNOON_DIR     - directory containing afternoon wallpapers
#   NIGHT_DIR         - directory containing night wallpapers
#   IPC_MAX_RETRIES   - max retries waiting for DMS IPC (default: 10)
#   IPC_RETRY_DELAY   - seconds between retries (default: 2)

function get_period
    set -l hour (date +%-H)
    if test $hour -ge 6 -a $hour -lt 12
        echo morning
    else if test $hour -ge 12 -a $hour -lt 18
        echo afternoon
    else
        echo night
    end
end

function get_period_dir -a period
    switch $period
        case morning
            echo $MORNING_DIR
        case afternoon
            echo $AFTERNOON_DIR
        case night
            echo $NIGHT_DIR
    end
end

function wait_for_ipc
    set -l max_retries (math (set -q IPC_MAX_RETRIES; and echo $IPC_MAX_RETRIES; or echo 10))
    set -l delay (math (set -q IPC_RETRY_DELAY; and echo $IPC_RETRY_DELAY; or echo 2))

    for i in (seq $max_retries)
        if dms ipc call night status &>/dev/null
            return 0
        end
        echo "Waiting for DMS IPC... ($i/$max_retries)"
        sleep $delay
    end

    echo "DMS IPC not available after $max_retries retries" >&2
    return 1
end

function set_random_wallpaper -a dir
    if not test -d $dir
        echo "Directory not found: $dir" >&2
        return 1
    end

    set -l wallpaper (fd -t f -d 1 -e jpg -e jpeg -e png -e webp -e avif -e bmp . $dir | shuf -n1)

    if test -z "$wallpaper"
        echo "No wallpapers found in $dir" >&2
        return 1
    end

    dms ipc call wallpaper set $wallpaper
    echo "Wallpaper: $wallpaper"
end

# Wait for DMS IPC to be ready
wait_for_ipc; or exit 1

# Set wallpaper
set period (get_period)
echo "Period: $period"
set_random_wallpaper (get_period_dir $period)

# Sync night mode with current period
# (DMS time automation handles future transitions, but doesn't check on startup)
if test $period = night
    dms ipc call night enable
    echo "Night mode enabled"
else
    dms ipc call night disable
    echo "Night mode disabled"
end
