# lineageplots
A visualization tool to create plots highlighting mutations in antibody lineages

## usage
### starting notebook with Docker
- run `git clone https://github.com/eharkins/lineageplots.git && cd lineageplots`
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

### using the notebook

The notebook includes two python functions which each take two arguments, in this order:
1. a json file describing one or many lineages (see `example_input`) including paths to the fastas containing those lineages.
2. an output directory

The two functions are:
1. `make_many_tick_plots()` which makes individual lineage plots, i.e. one plot per fasta, as opposed to
2. `make_many_combined_tick_plots()` which makes lineage plots combining pairs of fastas - one for the heavy chain and one for the light chain (see `example_input` for how to include this information).

Examples of the plots produced by each of these functions are in the `output` directory of this repo.
