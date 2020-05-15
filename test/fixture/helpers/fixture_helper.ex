defmodule Tixco.FixtureHelper do
  def rand_email() do
    rn = :rand.uniform()
    |> Float.to_string()
    |> String.slice(0, 8)
    "test#{rn}@tixco.com"
  end
end
