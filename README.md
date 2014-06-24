flow-tools Cookbook
============================

This cookbook used for configure flow-tools.

Requirements
------------


Attributes
----------

#### flow-tools::default
node['flow-tools']['capture'] => {
"myrouter" => "-w /var/flow/myrouter 0/10.1.1.10/3000",
"mysecondrouter" => "-w /var/flow/mysecondrouter -n 275 0/10.3.2.6/3002",
...,
"name" => "options"
}

read more about the options of flow-capture you can read on http://www.splintered.net/sw/flow-tools/docs/flow-capture.html


Usage
-----
#### flow-tools::default
Just include `flow-tools` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[flow-tools]"
  ]
}
```

Contributing
------------

License and Authors
-------------------
Authors: sewer

