# lineageplots
A visualization tool to create plots highlighting mutations in antibody lineages

## usage
### with Docker
- run `docker run -it --rm -v $(pwd):/mnt -p 8888:8888 quay.io/eharkins/altair:npm jupyter notebook --no-browser --ip=0.0.0.0 --port=8888`
- Paste the link into your browser including the auth token and you should be able to see the Jupyter Notebook there.
- Everything you need should be in the `mnt` directory.
- If you get a message like (probably wrapped by a message like `docker: Error response from daemon`):
```
Bind for 0.0.0.0:8888 failed: port is already allocated.
```
it probably means you already used that port and didn't properly kill the server.
To confirm, run:

`netstat -vanp tcp | grep LISTEN | grep <port-no>` (replace `<port-no>` with your port number).
The process id (`pid`) should be the second to last column in the output of the above; to kill that process, run `kill <pid>` and replace `<pid>` with the process id.
