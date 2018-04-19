httpcbench
==========

Erlang HTTP client benchmarks

The current test attempts to create 5000 concurrent http connections to a local server, which
responds after 10 ms.

## Results ##

Results show results at 20 iterations (100,000 connections).

| Client | runtime | wall_clock | mem | failures |
| ------ | :-:| :-:| :--:| :--:|
| hackney (default pool) | 18124 | 28185 | 24.161 | 0 |
| httpc | 14941 | 55652 | 47.802 | 0 |
| httpc (optimized) | 15289 | 45219 | 44.310 | 13 |
| ibrowse | 13249 | 19145 | 17.163 | 0 |
| ibrowse (optimized) | 11720 | 21813 | 25.330 | 0 |
| lhttpc | - | - | - | - |

Results are from Erlang 20.2. Running on Centos 7.4 VM with 1 cores running on a 2014 MacBook Pro.

httpc performs MUCH worse if {max_keepalive, infinity} is not set on the server.

## Running the tests ##

Make sure you have a high nofile limit, and enough sockets (on Ubuntu, 
`sudo sysctl -w net.ipv4.ip_local_port_range="2048 65535"`).

#### Terminal 1:

`./run_server`

#### Terminal 2:

`./run_client CLIENT`

CLIENT is one of hackney, httpc, httpc_opt, ibrowse, ibrowse_opt, lhttpc
