# test_kitchen_mssql_template
A template kitchen example for multi-node MSSQL integration testing for Test Kitchen.  
This cookbook creates two instances:  

1. A SQL Server `default-windows-mssql`
2. A client server `default-windows-2012r2`

# Scenario
You want to test a cookbook/PowerShell script/etc using test-kitche, but it requires a supporting MSSQL server for DB access.

# Usage
Copy the files from this repository into your cookbook's repo (merging files as necessary), then use the platform named 'windows-2012r2' in .kitchen.yml as your test bed. Replace the existing tests in default with the tests you wish to run and add a run_list that specifies your cookbook or other kitchen provisioners as you desire!

You will presumably need to populate the MSSQL server's IP in your cookbook/script somewhere. You can do this in Chef like so
```
search_query = 'run_list:*test_kitchen_mssql_helpers??server*'
sql_server_ip = search('node', search_query)[0]['ipaddress']
```

Or in any other scripting scenario by parsing the JSON file you can find in `%temp%\kitchen\nodes\default-windows-mssqlserver.json`.

# Dependencies
## kitchen-nodes
[https://github.com/mwrock/kitchen-nodes](https://github.com/mwrock/kitchen-nodes)
This is used to enable the client node to find the IP of the SQL Server (using Chef search or the JSON file mentioned above)
`gem install kitchen-nodes`  

# Author

Author:: Sam Martin (<samjackmartin@gmail.com>)