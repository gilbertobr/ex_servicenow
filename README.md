# ExServicenow
[![LinkedIn][linkedin-shield]][linkedin-url]

# About the project

![ServiceNow][logo-servicenow]

Project was developed to facilitate the creation/editing/updating of tickets generated via API REST Service Now.
If you are here, you must know that there are several functionalities that ServiceNow has, the idea is to integrate all tool products in this project.

Requirements:

* URL ServiceNow x User(Email) x Password

### This project can recognize all servicenow parameters, being able to make several filters

#
## Built with
 [![Elixir][Elixir-lang.org]][Elixir-url]

#
# 1. Change Request (change_request)

* List all tickets
```
ExServicenow.get_query_change_request([])
```
* List only 1 single ticket
```
ExServicenow.get_query_change_request([{"sysparm_limit", 1}])
```
* Filter a single ticket
```
ExServicenow.get_query_change_request([{"sysparm_query", "number=CHG0000000"}])
```
* Filter a single ticket to [CSV format](https://docs.servicenow.com/en-US/bundle/sandiego-platform-administration/page/administer/exporting-data/concept/query-parameters-display-value.html) (Exports the display value (true) or raw value (false) for the CSV, Excel, XLSX, and XML file formats.)
```
ExServicenow.get_query_change_request([{"sysparm_query", "number=CHG0000000"}, {"sysparm_display_value", "all"}])
```
* Create Ticket
```
ExServicenow.post_query_change_request(%{description: "Test_1", short_description: ""})
```
* Update Ticket
```
ExServicenow.put_query_change_request("CHG0000000", %{description: "Update_Test_1"})
```
# 2. Service Catalog (sc_req_item)

* List all tickets
```
ExServicenow.get_query_sc_req_item([])
```
* List only 5 tickets
```
ExServicenow.get_query_sc_req_item([{"sysparm_limit", 5}])
```
* Filter a single ticket
```
ExServicenow.get_query_sc_req_item([{"sysparm_query", "number=RITM0000000"}])
```
* Create Ticket
```
ExServicenow.post_query_sc_req_item(%{description: "Test_1"})
```
* Update Ticket
```
ExServicenow.put_query_sc_req_item("RITM0000000", %{description: "Test_1"})
```

# 3. Table Incidents (incident)
* List all incidents
```
ExServicenow.get_query_incident([])
```
* List only 5 incidents
```
ExServicenow.get_query_incident([{"sysparm_limit", 5}])
```
* Filter a single incident
```
ExServicenow.get_query_incident([{"sysparm_query", "number=INC0012992"}])
```
* Update incident
```
ExServicenow.put_query_incident("INC0000000", %{description: "Test_1"})
```
## Using Docker

#
[Image Information](https://hub.docker.com/r/dockergpsj/ex_servicenow)

#

1. Download the Image
```
docker pull dockergpsj/ex_servicenow:latest
```
2. Start queries on ServiceNow.

```
docker run -e "URL_SERVICENOW=https://myorganization.service-now.com" -e "USERNAME_SERVICENOW=email" -e "PASSWORD_SERVICENOW=password" -e "FUNCTION=ExServicenow.get_query_sc_req_item([{\"sysparm_query\", \"number=RITM0000000\"}])" dockergpsj/ex_servicenow:latest
```
Notice that there is a variable named FUNCTION.
In this field you put the name of the function you want.

## Important:
- On Linux, single or double quotes are passed verbatim into the value of the environment variable (i.e. including quotes)

- On Windows, single or double quotes are removed from the value of the environment variable (i.e. no quotes in the variable)

[Elixir-url]: https://elixir-lang.org/
[Elixir-lang.org]: https://elixir-lang.org/images/logo/logo.png
[logo-servicenow]: images/logo-servicenow.png
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/gilbertosj