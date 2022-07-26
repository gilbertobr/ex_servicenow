defmodule ExServicenow do
  @moduledoc false
  use Tesla
  alias ExServicenow.Handle

  plug Tesla.Middleware.BaseUrl, System.get_env("URL_SERVICENOW")
  plug Tesla.Middleware.BasicAuth, username: System.get_env("USERNAME_SERVICENOW"), password: System.get_env("PASSWORD_SERVICENOW")
  plug Tesla.Middleware.JSON, engine_opts: [keys: :atoms]

  def get_query_change_request(query), 
    do: get("/api/now/table/change_request", query: query) |> Handle.handle_get()

  def post_query_change_request(query),
    do: post("/api/now/table/change_request", query) |> Handle.handle_post()

  def put_query_change_request(number, query) do
    case get_query_change_request([{"sysparm_query", "number=#{number}"}]) do
      {:ok, change_request} -> 
        uniq = change_request |> Enum.at(0)
        put("/api/now/table/change_request/#{uniq.sys_id}", query) |> Handle.handle_put()

      {:error, failed} -> 
        failed
    end
  end
  
  def get_query_sc_req_item(query),
    do: get("/api/now/table/sc_req_item", query: query) |> Handle.handle_get()

  def post_query_sc_req_item(query),
    do: post("/api/now/table/sc_req_item", query) |> Handle.handle_post()

  def put_query_sc_req_item(number, query) do
    case get_query_sc_req_item([{"sysparm_query", "number=#{number}"}]) do
      {:ok, sc_req_item} -> 
        uniq = sc_req_item |> Enum.at(0)
        put("/api/now/table/sc_req_item/#{uniq.sys_id}", query) |> Handle.handle_put()

      {:error, failed} -> 
        failed
    end
  end

  def get_query_incident(query),
    do: get("/api/now/table/incident", query: query) |> Handle.handle_get()

  def post_query_incident(query),
    do: post("/api/now/table/incident", query) |> Handle.handle_post()

  def put_query_incident(number, query) do
    case get_query_incident([{"sysparm_query", "number=#{number}"}]) do
      {:ok, incident} -> 
        uniq = incident |> Enum.at(0)
        put("/api/now/table/incident/#{uniq.sys_id}", query) |> Handle.handle_put()

      {:error, failed} -> 
        failed
    end
  end
    
end
