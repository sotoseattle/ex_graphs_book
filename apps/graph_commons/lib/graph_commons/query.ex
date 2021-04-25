defmodule GraphCommons.Query do
  @derive {Inspect, except: [:path, :uri]}

  defstruct ~w[data file type path uri]a
  @enforce_keys ~w[data file type]a
  @storage_dir ""

  @typedoc "Types for querys."
  @type query_data :: String.t()
  @type query_file :: String.t()
  @type query_path :: String.t()
  # @type query_type :: queryCommons.query_type()
  @type query_uri :: String.t()
  @type t :: %__MODULE__{
    data: query_data,
    file: query_file,
    type: query_type,
    path: query_path,
    uri: query_uri }
  @typedoc "Types for query storage."
  @type base_type :: :dquery | :native | :property | :rdf | :tinker
  @type query_type :: base_type()
  @typedoc "Type for testing file types."
  @type file_test :: :dir? | :regular? | :exists?

  defguard is_query_type(tipo) when tipo in [:dquery, :native, :property, :rdf, :tinker]

  @spec new(query_data(), query_file(), query_type()) :: t
  def new(query_data, query_file, query_type) when is_query_type(query_type) do

    query_path = "#{@storage_dir}/#{query_type}/querys/#{query_file}"

    %__MODULE__{
      # user
      data: query_data,
      file: query_file,
      type: query_type,
      # system
      path: query_path,
      uri: "file://" <> query_path
    }
  end

end
