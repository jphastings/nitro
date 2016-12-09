defmodule Nitro.PortMonitor do
  def start_link do
    File.ls!("/dev/")
    # |> Enum.filter(&Regex.match?(~r/^sd[abcd]\d+$/, &1))
    |> Enum.sort |> Enum.each(&IO.inspect(&1))
  end
end
