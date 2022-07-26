defmodule ExServicenow.Handle do
    @moduledoc false

  def handle_get({:ok, %Tesla.Env{status: 401, body: body}}) do
    {:error, %{status: :bad_request, result: body.error}}
  end

  def handle_get({:ok, %Tesla.Env{status: 400, body: body}}) do
    {:error, %{status: :bad_request, result: body.error}}
  end

  def handle_get({:ok, %Tesla.Env{status: 200, body: %{result: []}}}) do
    {:error, %{status: :not_found, result: "Error Not Found!"}}
  end

  def handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body.result}
  end

  def handle_get({:error, reason}) do
    {:error, %{status: :bad_request, result: reason}}
  end

  def handle_post({:ok, %Tesla.Env{status: 403, body: body}}) do
    {:error, %{status: body.status, result: body.error}}
  end

  def handle_post({:ok, %Tesla.Env{status: 201, body: body}}) do
    {:ok, body.result}
  end
  
  def handle_post({:error, reason}) do
    {:error, %{status: :bad_request, result: reason}}
  end

  def handle_put({:ok, %Tesla.Env{status: 404, body: body}}) do
    {:error, %{status: body.status, result: body.error}}
  end

  def handle_put({:ok, %Tesla.Env{status: 401, body: body}}) do
    {:error, %{status: body.status, result: body.error}}
  end

  def handle_put({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body.result}
  end

  def handle_put({:error, reason}) do
    {:error, %{status: :bad_request, result: reason}}
  end

end