defmodule SessionManager do
  use DynamicSupervisor

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end


  @spec login(String.t) :: any()
  def login(username) do
    DynamicSupervisor.start_child(__MODULE__, {User, username})
  end
end

