flow-tools Cookbook
============================

This cookbook used for configure flow-tools.

Requirements
------------


Attributes
----------

#### flow-tools::capture


```ruby
node['flow-tools']['capture'] => {
  "myrouter" => {
    "param" => {
      "key" => "value",
      "key" => "value"
      ...
    },
    "workdir" => {
      "name" => "/tmp",
      "user" => "root",
      "group" => "root",
      "mode" => 0755
    },
    "lrp" => "0/0/3000"
  }
}
```
workdir - Work directory for flow-capture (default /tmp)  
..user - owner of work directory (default root)  
..group - group of work directory (default root)  
..mode - mode access of work directory (default 0755)

lrp - parameter localip/remoteip/port

read more about the params of flow-capture you can read on http://www.splintered.net/sw/flow-tools/docs/flow-capture.html

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

