build:
    Echo "Building my website :)"
    rustc src/main.rs -o backend

deploy:
    git add ./*
    git commit -m "Auto-Deployed so no need to write a message"
    git push
    sudo systemctl start docker
    docker build -t my-website .
    sudo docker run -d -p 80:80 my-website