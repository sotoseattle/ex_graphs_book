defmodule GraphCommons.Graph do
  defstruct ~w[data file type path uri]a
  @enforce_keys ~w[data file type]a
  @storage_dir ""

  @typedoc "Types for graphs."
  @type graph_data :: String.t()
  @type graph_file :: String.t()
  @type graph_path :: String.t()
  # @type graph_type :: GraphCommons.graph_type()
  @type graph_uri :: String.t()
  @type t :: %__MODULE__{
    data: graph_data,
    file: graph_file,
    type: graph_type,
    path: graph_path,
    uri: graph_uri }
  @typedoc "Types for graph storage."
  @type base_type :: :dgraph | :native | :property | :rdf | :tinker
  @type graph_type :: base_type()
  @type query_type :: base_type()
  @typedoc "Type for testing file types."
  @type file_test :: :dir? | :regular? | :exists?

  defguard is_graph_type(tipo) when tipo in [:dgraph, :native, :property, :rdf, :tinker]

  @spec new(graph_data(), graph_file(), graph_type()) :: t
  def new(graph_data, graph_file, graph_type) when is_graph_type(graph_type) do

    graph_path = "#{@storage_dir}/#{graph_type}/graphs/#{graph_file}"

    %__MODULE__{
      # user
      data: graph_data,
      file: graph_file,
      type: graph_type,
      # system
      path: graph_path,
      uri: "file://" <> graph_path
    }
  end



end
