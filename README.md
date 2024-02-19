[# A Docker Container for GeoDaCenter's spatial_access package](https://github.com/su-gis/docker_spatial_access)https://github.com/su-gis/docker_spatial_access

### Download the Dockerfile and follow the instructions below to create an environment for running the GeoDaCenter's spatial_access package which is available at: https://github.com/GeoDaCenter/spatial_access

# Build docker image

## If there is no image for spatial_access, you have to build it from Dockerfile. (You must do it for the first time)

```
docker build -t spatial_access .
```

# Create a new docker container (You must do it for the first time)

If you create a new docker image, you will not have a container yet. 
Thus, you have to create and run a new container from the image.
Note that the following command will remove the existing container.
So, if you already have the container and you want to keep it as is, skip this step.

```
docker run --name spatial_access -it --rm -p 9000:9000 spatial_access
conda activate spatial_access
jupyter notebook --ip 0.0.0.0 --port 9000 --no-browser --allow-root
```

# Restart the created docker container (Do it for the second time)

```
docker start spatial_access
conda activate spatial_access
jupyter notebook --ip 0.0.0.0 --port 9000 --no-browser --allow-root
```

# Access from a browser

Copy URL from jupyter notebook and paste it to a web browser.
Because JupyterLab is a server extension of the classic Jupyter Notebook server, you can launch JupyterLab by calling jupyter notebook and visiting the /lab URL. E.g., http://127.0.0.1:9000/lab



# Check URL (when it is disconnected, you will be required to enter the tocken. In this case, you will need commands below)

Run from host
```
docker exec -it spatial_access bash
conda activate spatial_access
jupyter notebook list
```



