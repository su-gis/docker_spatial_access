# A Docker Container for GeoDaCenter's spatial_access package

## Download the Dockerfile and follow the instructions below to create an environment for running the GeoDaCenter's spatial_access package which is available at: https://github.com/GeoDaCenter/spatial_access


# Build docker image

```
docker build -t spatial_access .
```

# Run a docker container

```
docker run --name spatial_access -it --rm -p 9000:9000 spatial_access
conda activate spatial_access
jupyter notebook --ip 0.0.0.0 --port 9000 --no-browser --allow-root
```


# Access from a browser

Copy URL from jupyter notebook and paste it to a web browser.


# Check URL

Run from host
```
docker exec -it spatial_access bash
conda activate spatial_access
jupyter notebook list
```

