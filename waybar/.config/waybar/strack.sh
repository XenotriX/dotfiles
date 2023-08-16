active_project=$(strack status | grep "Active project")
if [ -z "$active_project" ]; then
    echo "{\"text\": \"Not tracking\", \"tooltip\": \"Not tracking\", \"class\": \"test\", \"percentage\": 100 }"
    exit 0
fi
project=$(strack status | grep "Active project" | cut -d ' ' -f 3)
time=$(strack status | grep "Current session" | cut -d ' ' -f 3)
start=$(strack status | grep "Current session" | cut -d ' ' -f 6)
today=$(strack status | grep "Today" | cut -d ' ' -f 2)
echo "{\"text\": \"Tracking $project: $time\", \"tooltip\": \"Started at $start\\n$today hours today\", \"class\": \"test\", \"percentage\": 100 }"
