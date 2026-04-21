## Use neovim inside docker container
Start container `make docker-start-service-debug`\
Find out container id `docker container ls`\
Attatch to container `docker exec -it <container_id> bash`\
Create directory inside container `mkdir /root/nvim_docker`\
Copy install.sh to container `docker cp /home/artem/.config/docker_nvim/install.sh <container_id>:/root/nvim_docker`\
Set up neovim `source /root/nvim_docker/install.sh https://github.com/makeevmr/nvim`\
Run neovim to install plugins `nvim`\
Trust folder `git config --global --add safe.directory <workdir>`\
Change tabsize if needed with `nvim -c ":58" /root/.config/nvim/lua/core/config.lua`\
Create new image from running container `docker commit <container_id_or_name> <new_image_name>`\
For example `docker commit d9c38376de57 userver-framework-image-with-neovim`\
Edit `docker-compose.yml` change image to `<new_image_name>`

## Use same clipboard
Allow the container to access the host's X server `xhost +local:docker`\
Change `make docker-start-service-debug` build point to run\
`$(DOCKER_COMPOSE) run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -p 8080:8080 --rm url_shortener-container make -- --in-docker-start-$*`

## Start session
Start container `make docker-start-service-debug`\
Find out container id `docker container ls`\
Attatch to container `docker exec -it <container_id> bash`