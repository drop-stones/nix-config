# Pick a random wallpaper based on time of day and write it to a session file.
#
# Environment variables:
#   MORNING_DIR   - directory containing morning wallpapers
#   AFTERNOON_DIR - directory containing afternoon wallpapers
#   NIGHT_DIR     - directory containing night wallpapers
#   OUTPUT_FILE   - path to write the session JSON file

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

set period (get_period)
set dir (get_period_dir $period)

set wallpaper (fd -t f -d 1 -e jpg -e jpeg -e png -e webp -e avif -e bmp . $dir | shuf -n1)

if test -z "$wallpaper"
    echo "No wallpapers found in $dir" >&2
    exit 1
end

echo "Greeter wallpaper: $wallpaper"

mkdir -p (dirname $OUTPUT_FILE)
printf '{"wallpaperPath":"%s"}\n' $wallpaper > $OUTPUT_FILE
