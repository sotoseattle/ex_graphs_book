defmodule GraphCommons do

  @priv_dir "#{:code.priv_dir(:graph_commons)}"

  def exports_dir(), do: @priv_dir <> "/transfer/exports"
  def imports_dir(), do: @priv_dir <> "/transfer/imports"
  def scripts_dir(), do: @priv_dir <> "/extras/scripts"
  def storage_dir(), do: @priv_dir <> "/storage"

end
